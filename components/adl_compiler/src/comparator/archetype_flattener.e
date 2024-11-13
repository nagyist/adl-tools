note
	component:   "openEHR ADL Tools"
	description: "[
				 Generate a flat archetype from a source differential form archetype, and, if the latter is
				 specialised, its flat parent.
				 The flattener assumes that the input differential archetype is valid according to the rules
				 implemented in AOM_PHASE_*_VALIDATORs, and defined by the openEHR ADL 2 specification.
		         ]"
	keywords:    "archetype, comparison, constraint model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2008- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_FLATTENER

inherit
	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	ADL_2_TERM_CODE_TOOLS
		export {NONE}
			all
		end

	INTERNAL
		export
			{NONE} all
		end

	EXCEPTIONS
		rename
			class_name as exception_class_name
		export
			{NONE} all
		end

feature -- Access

	arch_flat_parent: AUTHORED_ARCHETYPE
			-- flat archetype of parent, if applicable
		attribute
			create Result.default_create
		end

	arch_diff_child: ARCHETYPE
			-- archetype for which flat form is being generated
		attribute
			create Result.default_create
		end

	arch_flat_out: AUTHORED_ARCHETYPE
			-- generated flat archetype - logically an overlay of `arch_flat_parent' and `arch_diff_child'
			-- if the `arch_diff_child' is a template, the dynamic type will be OPERATIONAL_TEMPLATE
		attribute
			create Result.default_create
		end

feature -- Commands

	execute (a_flat_parent: AUTHORED_ARCHETYPE; a_diff_child: ARCHETYPE; an_rm: BMM_MODEL)
			-- create with source (differential) archetype of archetype for which we wish to generate a flat archetype
		require
			Parent_valid: a_flat_parent.is_valid and then a_flat_parent.is_flat
			Child_valid: a_diff_child.is_valid and then a_diff_child.is_differential
			Specialisation_relationship: a_diff_child.specialisation_depth = a_flat_parent.specialisation_depth + 1
		do
			arch_diff_child := a_diff_child
			arch_flat_parent := a_flat_parent

			ref_model := an_rm

			if attached {TEMPLATE} arch_diff_child then
				create {TEMPLATE} arch_flat_out.make_from_other (arch_flat_parent)
			else
				arch_flat_out := arch_flat_parent.deep_twin
			end

			-- overlay various identification and meta-data elements, and adjust languages and translations
			arch_flat_out.overlay_differential (arch_diff_child)

			-- core definitional parts
			flatten_definition
			flatten_rules
			arch_flat_out.terminology.merge (arch_diff_child.terminology)

			-- any parts that rely on paths have to be done after definition flattening: annotations
			if attached {AUTHORED_ARCHETYPE} arch_diff_child as auth_arch_diff_child then
				arch_flat_out.merge_annotations_from_resource (auth_arch_diff_child)
			end

			arch_flat_out.set_is_valid

			arch_flat_out.rebuild
		ensure
			arch_flat_out.is_flat and then arch_flat_out.is_valid
		end

feature {NONE} -- Implementation

	ref_model: BMM_MODEL
			-- utility reference to RM schema used for validation & flattening
		attribute
			create Result
		end

	flatten_definition
			-- build the flat archetype definition by traversing src_archetype and determining what
			-- nodes from flat_archetype to add; do the changes to the output archetype
		local
			def_it: C_ITERATOR
			og_ca_path_in_diff, og_co_parent_path_in_diff: OG_PATH
			co_parent_path_in_diff: STRING
			ca_clone: C_ATTRIBUTE
		do
			-- traverse flat output and mark every node as inherited
			arch_flat_out.definition.set_subtree_specialisation_status (ss_inherited)

			-- intialise tuple post-processing list
			tuple_objects.wipe_out

			-- do all nodes
			create def_it.make (arch_diff_child.definition)
			def_it.do_until_surface (agent overlay_ac_node, agent overlay_ac_node_test)

			-- do root node
			arch_flat_out.definition.overlay_differential_root (arch_diff_child.definition)

			-- now graft in any 'ADD' C_ATTRIBUTEs on root node
			across arch_diff_child.definition.attributes as diff_attrs_csr loop
				-- non-differential path top level attribute to be added
				if not diff_attrs_csr.item.has_differential_path then
					if not arch_flat_out.definition.has_attribute (diff_attrs_csr.item.rm_attribute_name) then
						arch_flat_out.definition.put_attribute (diff_attrs_csr.item.safe_deep_twin)
					end
				-- differential path attribute to be added deeper down
				else
					og_ca_path_in_diff := diff_attrs_csr.item.og_path
					if not arch_flat_out.definition.has_path (og_ca_path_in_diff.as_string) then
						og_co_parent_path_in_diff := og_ca_path_in_diff.parent_path
						co_parent_path_in_diff := og_co_parent_path_in_diff.as_string

						-- if parent path not findable, overlay it, it must contain some id overrides
						if not arch_flat_out.definition.has_object_path (co_parent_path_in_diff) then
							overlay_differential_path (og_co_parent_path_in_diff)
						end

						if arch_flat_out.definition.has_object_path (co_parent_path_in_diff) then
							ca_clone := diff_attrs_csr.item.safe_deep_twin
							ca_clone.clear_differential_path
							if attached {C_COMPLEX_OBJECT} arch_flat_out.definition.object_at_path (co_parent_path_in_diff) as att_cco then
								att_cco.put_attribute (ca_clone)
							end
						else
							raise ("flatten_definition loction #1 - can't find overlay location for C_COMPLEX_OBJECT at " + co_parent_path_in_diff + " %N")
						end
					end
				end
			end

			-- perform tuple post processing
			process_tuple_objects
		end

	overlay_ac_node (ac_diff_node: ARCHETYPE_CONSTRAINT; depth: INTEGER)
			-- perform overlays of C_ATTRIBUTE node from differential archetype on corresponding node in flat parent.
		local
			apa: ARCHETYPE_PATH_ANALYSER
			ca_path_in_output: STRING
			ca_output, ca_in_flat_parent: C_ATTRIBUTE
			co_copy: C_OBJECT
		do
			if attached {C_ATTRIBUTE} ac_diff_node as ca_diff then
				-- --------------------- STEP 1: locate node in flat output -------------------------
				-- First we have to figure out path of overlay location in output flat. It could be:
				-- 	* the exact path of the differential C_ATTRIBUTE (including any differential path)
				-- 	* the flat parent form of this path, if no previous overlays have overridden any
				--	  object nodes in the path.
				ca_path_in_output := ca_diff.path
				if not arch_flat_out.has_path (ca_path_in_output) then
					-- --------------------- STEP 2: perform any differential path node_id overrides -------------------------
					--  this supports the ability of a differential path to contain an override of an id code in it.
					if ca_diff.has_differential_path then
						-- there must be id-code overrides in some differential path in the path; we need to overlay these
						-- into the output archetype structure
						overlay_differential_path (ac_diff_node.og_path)
					else
						raise ("overlay_ac_node loction #1 - can't find overlay location for C_ATTRIBUTE at " + ca_path_in_output + " %N")
					end
				end
				ca_output := arch_flat_out.attribute_at_path (ca_path_in_output)

				-- figure out the corresponding C_ATTRIBUTE node in the flat ancestor
				create apa.make (ca_diff.og_path)
				check attached {C_ATTRIBUTE} arch_flat_parent.attribute_at_path (apa.path_at_level (arch_flat_parent.specialisation_depth)) as att_ca then
					ca_in_flat_parent := att_ca
				end

				-- --------------------- STEP 3: perform C_ATTRIBUTE overrides -------------------------
				if ca_diff.is_prohibited then -- existence = {0}; remove the attribute completely
					-- mark - for correct data validation we need the attribute marked as prohibited
					-- otherwise it appears that the attribute is allowed
					-- It will be removed during full template expansion
					ca_output.set_prohibited
					ca_output.remove_all_children
					ca_output.set_specialisation_status_redefined
				else
					-- all attributes: overlay the attribute existence if that has been changed
					if attached ca_diff.existence as att_ex then
						ca_output.set_existence (att_ex.deep_twin)
						ca_output.set_specialisation_status_redefined
					end

					-- --------------------- STEP 4: process C_ATTRIBUTE children -------------------------
					-- attribute in a tuple constraint: remove all child C_OBJs and do a complete replacement
					if ca_diff.is_second_order_constrained then
						ca_output.remove_all_children
						across ca_diff.children as cpo_csr loop
							co_copy := cpo_csr.item.safe_deep_twin
							co_copy.set_specialisation_status_redefined
							ca_output.put_child (co_copy)
						end

						-- record the parent object in the output flat in the tuple post-processing list
						if attached ca_output.parent as att_cco then
							tuple_objects.extend (att_cco)
						end

					-- if a container attribute then do a merge
					elseif ca_diff.is_multiple then
						-- overlay the cardinality if that was changed
						if attached ca_diff.cardinality as att_card then
							ca_output.set_cardinality (att_card.deep_twin)
							ca_output.set_specialisation_status_redefined
						end
						-- for container attributes in the source archetype, we build a merge list to properly deal with 'after'
						-- and 'before' keywords in differential archetype
						build_ca_merge_list (ca_output, ca_diff)
						across ca_merge_list as merge_list_csr loop
							do_ca_merge (ca_output, ca_diff, ca_in_flat_parent, merge_list_csr.item)
						end

					-- if a single-valued attribute then do a merge of alternates
					else
						-- handle C_PRIMITVE_OBJECTs here
						if attached {C_PRIMITIVE_OBJECT} ca_diff.first_child as cpo and then attached {C_COMPLEX_OBJECT} ca_output.first_child then
							ca_output.replace_child_by_id (ca_diff.first_child.safe_deep_twin, ca_output.first_child.node_id)
						else
							-- do the merge with a synthesised merge descriptor that just says merge everything to the end
							do_ca_merge (ca_output, ca_diff, ca_in_flat_parent, [1, ca_diff.child_count, Void, False])
						end
					end
				end
			end
		end

	overlay_ac_node_test (a_c_node: ARCHETYPE_CONSTRAINT): BOOLEAN
			-- return True if a conformant path of a_c_node in the differential archetype is found within the flat
			-- parent archetype - i.e. a_c_node is inherited or redefined from parent (but not new)
		local
			apa: ARCHETYPE_PATH_ANALYSER
		do
			create apa.make (a_c_node.og_path)
			if not apa.is_phantom_path_at_level (arch_flat_parent.specialisation_depth) then
				Result := arch_flat_parent.has_path (apa.path_at_level (arch_flat_parent.specialisation_depth))
			end
		end

	overlay_differential_path (an_og_diff_path: OG_PATH)
			-- overlay a differential path onto the flat output structure. Only call for paths that
			-- are not findable in the output; it means that the path contains a specialised id-code
			-- that needs to be written into the output; the path will then be findable
		require
			not arch_flat_out.definition.has_path (an_og_diff_path.as_string)
		local
			ca_csr: C_ATTRIBUTE
			cco_csr: C_COMPLEX_OBJECT
			set_spec_sts: BOOLEAN
			co_diff_node_id: STRING
		do
			cco_csr := arch_flat_out.definition
			across an_og_diff_path as og_path_csr loop
				-- navigate to C_ATTRIBUTE
				ca_csr := cco_csr.attribute_with_name (og_path_csr.item.attr_name)
				co_diff_node_id := og_path_csr.item.object_id

				-- navigate to C_COMPLEX_OBJECT & adjust id if needed:
				if og_path_csr.item.is_addressable then
					set_spec_sts := False
					if specialisation_depth_from_code (co_diff_node_id) = arch_diff_child.specialisation_depth and
						not ca_csr.has_child_with_id (co_diff_node_id)
					then
						ca_csr.replace_node_id (code_at_level (co_diff_node_id, arch_flat_parent.specialisation_depth), co_diff_node_id)
						set_spec_sts := True
					end
					check attached {C_COMPLEX_OBJECT} ca_csr.child_with_id (co_diff_node_id) as att_cco then
						cco_csr := att_cco
						if set_spec_sts then
							cco_csr.set_specialisation_status_redefined
						end
					end
				elseif ca_csr.has_children then
					if attached {C_COMPLEX_OBJECT} ca_csr.first_child as att_cco then
						cco_csr := att_cco
					end
				end
			end
		ensure
			arch_flat_out.definition.has_path (an_og_diff_path.as_string)
		end

	build_ca_merge_list (ca_output, ca_diff: C_ATTRIBUTE)
			-- build merge list for merging objects in container attribute `ca_diff' into the corresponding
			-- container attribute `ca_output' in the output structure, using ordering information in source
			-- attribute objects, and replacing or inserting as appropriate.
			-- The merge list is used like a set of transactions to be processed in the routine `do_ca_merge`
		require
			Non_empty_attribute: ca_output.has_children
		local
			co_output_csr: C_OBJECT
			after_pending: BOOLEAN
			start_pos, end_pos, co_csr_pos: INTEGER
			sibling_anchor: SIBLING_ORDER
			co_list: ARRAYED_LIST [C_OBJECT]
			co_node_id, co_parent_node_id: STRING
		do
			ca_merge_list.wipe_out
			start_pos := 1
			co_output_csr := ca_output.first_child
			co_list := ca_diff.children
			from co_list.start until co_list.off loop
				-- find the next ordering marker, or end of list
				from until co_list.off or attached co_list.item.sibling_order loop
					co_list.forth
				end

				if not co_list.off then
					check attached co_list.item.sibling_order as att_so then
						sibling_anchor := att_so
					end

					-- grab pending series from start_pos to here -1 and make a merge record for it
					if after_pending then
						end_pos := co_list.index - 1
						add_merge_desc (start_pos, end_pos, co_output_csr, False)
						after_pending := False
						start_pos := end_pos + 1
					end

					-- Obtain the sibling anchor in the output flat:
					-- if overlay has already occurred, we look for sibling anchor using child level node id
					-- otherwise use flat parent level id
					if ca_output.has_child_with_id (sibling_anchor.sibling_node_id) then
						co_output_csr := ca_output.child_with_id (sibling_anchor.sibling_node_id)
					else
						co_output_csr := ca_output.child_with_id (code_at_level (sibling_anchor.sibling_node_id, arch_flat_parent.specialisation_depth))
					end

					-- if the order marker is 'before', it means that the merge list is from the last
					-- point already taken care of + 1, until the current object, and the merge target in the
					-- output structure is the object with the same id as the last object just found, carrying
					-- the 'before' marker
					if sibling_anchor.is_before then
						end_pos := co_list.index
						add_merge_desc (start_pos, end_pos, co_output_csr, True)
						start_pos := end_pos + 1

					-- marker is 'after' - this means that all the objects from the last position dealt with,
					-- up until the one with the marker on it (but not including it); so we need to merge
					-- that list before the csr position object in the output list; then we need to reset the
					-- source list start_pos to the item with the 'after' marker, and the output list cursor object
					-- to the object with the same id as the object holding the 'after' marker
					else
						-- create a descriptor for the preceding section
						if not co_list.isfirst and co_list.index > start_pos then
							add_merge_desc (start_pos, co_list.index - 1, co_output_csr, True)
						end
						-- now take care of series starting with current 'after' marker
						start_pos := co_list.index
						after_pending := True
					end
					co_list.forth
				end
			end

			-- if there is a last 'after' section, create a merge record for it.
			if after_pending then
				add_merge_desc (start_pos, co_list.count, co_output_csr, False)

			-- Deal with whatever is left in the list (could be everything)
			else
				co_output_csr := Void
				end_pos := start_pos
				from co_csr_pos := start_pos until co_csr_pos > co_list.count loop
					co_node_id := co_list.i_th (co_csr_pos).node_id
					if code_exists_at_level (co_node_id, arch_flat_parent.specialisation_depth) then
						co_parent_node_id := code_at_level (co_node_id, arch_flat_parent.specialisation_depth)

						-- try to find redefinition parent of node
						if ca_output.has_child_with_id (co_parent_node_id) then
							if ca_output.child_with_id (co_parent_node_id) /= co_output_csr then
								-- create a merge record for objects so far
								if attached co_output_csr then
									add_merge_desc (start_pos, end_pos, co_output_csr, False)
									start_pos := end_pos + 1
									end_pos := start_pos
								end
								co_output_csr := ca_output.child_with_id (co_parent_node_id)
							else
								end_pos := end_pos + 1
							end
						else
							end_pos := end_pos + 1
						end
					else
						end_pos := end_pos + 1
					end
					co_csr_pos := co_csr_pos + 1
				end

				-- if there is anything left, create a merge record for it.
				if start_pos <= co_list.count then
					add_merge_desc (start_pos, co_list.count, if attached co_output_csr then co_output_csr else ca_output.children.last end, False)
				end
			end
		end

	do_ca_merge (ca_output, ca_diff, ca_flat_parent: C_ATTRIBUTE; merge_desc: like ca_merge_list.item)
			-- merge `ca_diff's children into `ca_output'. `ca_flat_parent' is the corresponding node in the flat parent
			-- needed where cloning occurs
		local
			co_child_diff, new_obj: C_OBJECT
			child_ca: C_ATTRIBUTE
			node_id_in_flat_anc: STRING
			co_output_insert_pos, co_override_target, co_override_candidate: detachable C_OBJECT
			i: INTEGER
			co_child_spec_sts: INTEGER
			clone_needed: BOOLEAN
		do
			co_output_insert_pos := merge_desc.co_output_insert_pos
			from i := merge_desc.start_pos until i > merge_desc.end_pos loop
				co_child_diff := ca_diff.children.i_th (i)
				co_child_spec_sts := specialisation_status_from_code (co_child_diff.node_id, arch_diff_child.specialisation_depth)
				co_override_target := Void

				if co_child_spec_sts = ss_added then
					-- ===================== ADD new: detect via node id =====================
					-- if node_id indicates it is is to be added new in this level, e.g. something like id0.3 in level 2, add the node
					new_obj := co_child_diff.safe_deep_twin
					new_obj.deep_set_specialisation_status_added
					if attached co_output_insert_pos as att_co_ins_pos then
						if merge_desc.before_flag then
							ca_output.put_child_left (new_obj, att_co_ins_pos)
						else
							ca_output.put_child_right (new_obj, att_co_ins_pos)
							co_output_insert_pos := new_obj
						end
					else
						ca_output.put_child (new_obj)
					end

				else
					node_id_in_flat_anc := code_at_level (co_child_diff.node_id, arch_flat_parent.specialisation_depth)

					-- ================== Direct REPLACE: child node id is same as that of object in ancestor  ================
					if ca_output.has_child_with_id (co_child_diff.node_id) then
						co_override_target := ca_output.child_with_id (co_child_diff.node_id)

						-- ------ REMOVE: delete node in output --------
						if co_child_diff.is_prohibited then
							-- capture insert point before doing deletion
							check attached co_override_target end
							if attached ca_output.child_after (co_override_target) as att_co then
								co_output_insert_pos := att_co
							elseif attached ca_output.child_before (co_override_target) as att_co then
								co_output_insert_pos := att_co
							end
							ca_output.remove_child (co_override_target)

						else
							overlay_co_node (ca_output, co_override_target, co_child_diff)

							-- we reset the insert pos marker object in case the above call caused a new object creation
							co_output_insert_pos := ca_output.child_with_id (co_child_diff.node_id)
						end

					-- ===================== Logical REDEFINE: child node id is specialised in this level ========================
					elseif ca_flat_parent.has_child_with_id (node_id_in_flat_anc) then

						-- the clone_needed flag is set to True if a clone of the sub-tree of the corresponding node in the
						-- flat parent is to be created in the output, prior to overlay by the diff child structure
						clone_needed := False

						-- REDEFINE: node with parent node_id still available in flat output
						if ca_output.has_child_with_id (node_id_in_flat_anc) then
							co_override_candidate := ca_output.child_with_id (node_id_in_flat_anc)

							-- --------- REDEFINE of ARCHETYPE_SLOT by C_ARCHETYPE_ROOT: ALWAYS add --------
							-- --------- REDEFINE of empty C_COMPLEX_OBJECT by C_ARCHETYPE_ROOT: ALWAYS add --------
							if attached {C_ARCHETYPE_ROOT} co_child_diff and (attached {ARCHETYPE_SLOT} co_override_candidate or
								attached {C_COMPLEX_OBJECT} co_override_candidate and not attached {C_ARCHETYPE_ROOT} co_override_candidate)
							then
								new_obj := co_child_diff.safe_deep_twin
								new_obj.set_specialisation_status_redefined
								ca_output.put_child_left (new_obj, co_override_candidate)

								-- we don't set any override target - the slot-filling has been done above, and we
								-- don't (of course) override the slot with the filler.
							else
								co_override_target := co_override_candidate

								-- determine if clone needed: we don't clone if:
								--	* override target has max occurrences = 1 set OR
								--	* child diff obj being processed is sole child of its parent, and has max occurrences = 1
								clone_needed := not (co_override_target.effective_occurrences (agent ref_model.property_object_multiplicity).upper = 1 or
									ca_diff.aggregate_occurrences_upper_is_one (node_id_in_flat_anc, agent ref_model.property_object_multiplicity))
							end

						-- REDEFINE: node with parent node_id only available in flat ancestor - this means that in the flat output,
						-- an object with the parent node id has already been overridden - cloning is unavoidable
						else
							clone_needed := True
						end

						if clone_needed then
							co_override_target := ca_flat_parent.child_with_id (node_id_in_flat_anc).safe_deep_twin
							co_override_target.set_root_node_id (co_child_diff.node_id)
							co_override_target.set_subtree_specialisation_status (ss_inherited)
							co_override_target.set_specialisation_status_redefined
							if attached co_output_insert_pos as att_co_ins_pos then
								if merge_desc.before_flag then
									ca_output.put_child_left (co_override_target, att_co_ins_pos)
								else
									ca_output.put_child_right (co_override_target, att_co_ins_pos)
									co_output_insert_pos := co_override_target
								end
							else
								ca_output.put_child (co_override_target)
							end
						else
							-- if there is an override target set, perform an id override
							if attached co_override_target as att_tgt and then attached att_tgt.parent as ca then
								ca.replace_node_id (node_id_in_flat_anc, co_child_diff.node_id)
							end
						end

						if attached co_override_target as att_tgt then
							overlay_co_node (ca_output, att_tgt, co_child_diff)

							-- we reset the insert pos marker object in case the above call caused a new object creation
							co_output_insert_pos := ca_output.child_with_id (co_child_diff.node_id)
						end

					else
						raise ("do_ca_merge location #1 - child archetype node with path " + co_child_diff.path + " can't be flattened")
					end
				end

				-- -------- Deal with C_COMPLEX_OBJECT sub-structure in override cases ------------						
				-- graft in any C_ATTRIBUTEs under the differential C_COMPLEX_OBJECT which are new (ADDs) with respect to
				-- the flat output C_ATTRIBUTE, and have not yet been cloned or copied above, and don't have a differential path
				-- (the latter is dealt in `flatten_definition').
				if attached {C_COMPLEX_OBJECT} co_override_target as att_output_cco and attached {C_COMPLEX_OBJECT} co_child_diff as att_diff_cco then
					across att_diff_cco.attributes as diff_attrs_csr loop
						child_ca := diff_attrs_csr.item
						if not child_ca.has_differential_path and not att_output_cco.has_attribute (child_ca.rm_attribute_name) then
							att_output_cco.put_attribute (child_ca.safe_deep_twin)

							check attached att_output_cco.attribute_with_name (child_ca.rm_attribute_name).parent as child_ca_parent_co then
								-- if the attribute is part of a tuple of this C_OBJECT,
								-- record the parent object in the output flat in the tuple post-processing list
								if child_ca.is_second_order_constrained then
									tuple_objects.extend (child_ca_parent_co)
								end
							end
						end
					end
				end

				i := i + 1
			end
		end

	overlay_co_node (ca_output: C_ATTRIBUTE; co_override_target, co_child_diff: C_OBJECT)
			-- perform a node-level overlay with a target output node and a source child node
			-- This routine might create a new clone from the `co_child_diff' if `co_override_target'
			-- has any_allowed (no children). If this happens, it means the replaced object in the
			-- output won't be the insert position any more.
		require
			Target_is_child_of_attr_node: ca_output.has_child (co_override_target)
			Nodes_have_same_id: co_override_target.node_id.same_string (co_child_diff.node_id)
		local
			new_obj: C_OBJECT
		do
			-- ------ REPLACE C_COMPLEX_OBJECT - any_allowed - complete replace, regardless of AOM subtype -----
			if attached {C_COMPLEX_OBJECT} co_override_target as cco_ovd and then
				cco_ovd.any_allowed and then not attached {C_COMPLEX_OBJECT} co_child_diff
			-- ------ REPLACE C_PRIMITIVE_OBJECT - complete replace, regardless of AOM subtype -----
				or else attached {C_PRIMITIVE_OBJECT} co_child_diff
			then
				new_obj := co_child_diff.safe_deep_twin
				ca_output.replace_child_by_id (new_obj, new_obj.node_id)
				new_obj.set_specialisation_status_redefined

			-- ------ Any other REPLACE: just do local node override ---------
			else
				ca_output.overlay_differential (co_override_target, co_child_diff)

				-- deal with any second-order constraint on the C_OBJECT
				if attached {C_COMPLEX_OBJECT} co_child_diff as cco_diff and then
					cco_diff.has_attribute_tuples
				then
					check attached {C_COMPLEX_OBJECT} co_override_target as cco_ovd and
						attached cco_diff.attribute_tuples as cco_diff_tuples
					then
						across cco_diff_tuples as cco_diff_tuple_csr loop
							cco_ovd.put_attribute_tuple (cco_diff_tuple_csr.item.twin)
						end
						tuple_objects.extend (cco_ovd)
					end
				end
			end
		end

	ca_merge_list: ARRAYED_LIST [TUPLE [start_pos: INTEGER; end_pos: INTEGER; co_output_insert_pos: detachable C_OBJECT; before_flag: BOOLEAN]]
			-- merge descriptor list of TUPLEs of the following structure:
			--	start pos in source list: INTEGER
			--	end pos in source list: INTEGER
			-- 	insert obj in target list: C_OBJECT (can't be an index, because insertions will make the list change)
			-- 	insert side: BOOLEAN; True = prepend before, False = append after
		attribute
			create Result.make (0)
		end

	add_merge_desc (src_start_pos, src_end_pos: INTEGER; tgt_co_output_insert_pos: C_OBJECT; before_flag: BOOLEAN)
			-- create a merge tuple for use in later merging
		require
			Index_validity: src_start_pos <= src_end_pos
		local
			merge_desc: like ca_merge_list.item
		do
			create merge_desc
			merge_desc.start_pos := src_start_pos
			merge_desc.end_pos := src_end_pos
			merge_desc.co_output_insert_pos := tgt_co_output_insert_pos
			merge_desc.before_flag := before_flag
			ca_merge_list.extend (merge_desc)
			debug ("flatten")
				io.put_string ("%T%T%T=== added MERGE DESC " + src_start_pos.out + ", " + src_end_pos.out + ", " + tgt_co_output_insert_pos.node_id + ", " + before_flag.out + "%N")
			end
		end

	process_tuple_objects
			-- Currently, tuples are represented by static objects with references to
			-- C_ATTRIBUTEs and C_PRIMITIVEs; when creating a recursive copy of a
			-- C_COMPLEX_OBJECT, as occurs in flattening, the tuple structure usually
			-- cannot be deep-copied if the source CCO's child attributes are not
			-- deep-copied. This means that a shallow copy of the tuple objects will
			-- typically contain wrong C_ATTRIBUTE references. This can usually only
			-- be rectified when the whole definition structure is done, in a post-
			-- processing phase, supplied by this procedure. A more permanent solution
			-- would be to convert the representation to a simple set of tuples of
			-- attribute names, and always compute the structure on demand.
		local
			new_ca_tuple: C_ATTRIBUTE_TUPLE
		do
			across tuple_objects as cco_csr loop
				check attached cco_csr.item.attribute_tuples as cco_ca_tuples then
					-- iterate across the C_ATTR tuples in this CCO
					across cco_ca_tuples as ca_tuple_csr loop
						-- create a new attribute tuple in the output flat
						create new_ca_tuple.make

						-- iterate across the C_ATTRIBUTEs in the tuple in the target flat CCO;
						-- they will probably be wrong, i.e. refs to C_ATTRIBUTEs in the differential;
						-- need to replace by refs to same-named C_ATTRIBUTEs under this CCO, and
						-- then rebuilt.
						across ca_tuple_csr.item as ca_csr loop
							new_ca_tuple.put_member (cco_csr.item.attribute_with_name (ca_csr.item.rm_attribute_name))
						end

						new_ca_tuple.rebuild
						if cco_csr.item.has_comparable_attribute_tuple (new_ca_tuple) then
							cco_csr.item.replace_comparable_attribute_tuple (new_ca_tuple)
						else
							cco_csr.item.put_attribute_tuple (new_ca_tuple)
						end
					end
				end
			end
		end

	tuple_objects: ARRAYED_SET [C_COMPLEX_OBJECT]
		attribute
			create Result.make (0)
		end

	flatten_rules
			-- build the flat archetype invariants as the sum of parent and source invariants
		do
			if attached arch_diff_child.rules as att_rules then
				across att_rules as rules_csr loop
					arch_flat_out.add_rule (rules_csr.item.deep_twin)
				end
			end
		end

end


