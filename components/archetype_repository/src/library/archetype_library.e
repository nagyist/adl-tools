note
	component:   "openEHR ADL Tools"
	description: "[
				 Archetype library - a data structure containing archetypes (of any kind) found
				 in one or more physical locations, each of which is on some medium, such as the 
				 file system or a web-accessible repository. 
				 
				 The structure of the library is a list of top-level packages, each containing
				 an inheritance tree of first degree descendants of a class that provides 
				 archetyping capability, such as the openEHR class LOCATABLE or the 13606 class
				 RECORD_COMPONENT (which class it is is marked in the .bmm schema for the relevant
				 reference model).
				 
				 The contents of the structure consist of archetypes found in the reference and
				 working repositories, and are subsequently attached into the structure.
				 Archetypes opened adhoc are also grafted here.
				 
				 The library is populated at startup, using the source repository paths stored in a
				 configuration file or elsewhere.
				 
				 Archetypes can also be explicitly loaded by the user at runtime, outside of the 
				 repositories, e.g. the user wants to look at an archetype sent to him in email and
				 stored in /tmp. These archetypes are remembered on the 'adhoc_repository', and this 
				 is also merged into the directory by 'grafting'.
				 
				 In the resulting library, the archetype descriptors from each repository are marked
				 so that calling routines can distinguish them, e.g. to use different coloured icons on 
				 the screen.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006-2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_LIBRARY

inherit
	SHARED_ARCHETYPE_RM_ACCESS
		export
			{NONE} all;
			{ANY} has_rm_schema_for_archetype_id
		end

	ANY_VALIDATOR
		rename
			validate as populate
		end

	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

	ARCHETYPE_STATISTICAL_DEFINITIONS
		export
			{NONE} all
		end

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make (a_lib_access: ARCHETYPE_LIBRARY_INTERFACE)
		do
			library_access := a_lib_access
			clear
			if not item_tree_prototype.has_children then
				initialise_item_tree_prototype
				clone_item_tree_prototype
				schema_load_counter := rm_schemas_access.load_count
			end
		end

feature -- Access

	library_access: ARCHETYPE_LIBRARY_INTERFACE
			-- the repository profile accessor from which this library gets its contents

	archetype_with_id (an_archetype_id: STRING): ARCH_LIB_ARCHETYPE
			-- get the archetype with physical id `an_archetype_id'
		require
			has_archetype_with_id (an_archetype_id)
		do
			if library_access.adhoc_source.has_archetype_with_id (an_archetype_id) then
				Result := library_access.adhoc_source.archetype_with_id (an_archetype_id)
			else
				Result := library_access.source.archetype_with_id (an_archetype_id)
			end
		end

	matching_ids (a_regex: STRING; an_rm_type, an_rm_closure: detachable STRING): ARRAYED_SET [STRING]
			-- generate list of archetype ids that match the regex pattern and optional rm_type. If rm_type is supplied,
			-- we assume that the regex itself does not contain an rm type. Matching using `an_tm_type' and
			-- `an_rm_closure' is done in lower case. Any case may be supplied for these two
		require
			Regex_valid: not a_regex.is_empty
			Rm_type_valid: attached an_rm_type as att_rm_type implies not att_rm_type.is_empty
			Rm_closure_valid: attached an_rm_closure as att_rm_closure implies not att_rm_closure.is_empty
		do
			Result := library_access.source.matching_ids (a_regex, an_rm_type, an_rm_closure)
		ensure
			across Result as ids_csr all has_item_with_id (ids_csr.item) end
		end

	archetype_matching_ref (an_archetype_ref: STRING): detachable ARCH_LIB_ARCHETYPE
			-- Return archetype whose id matches `an_archetype_ref'
		do
			if attached library_access.source.archetype_matching_ref (an_archetype_ref) as ala then
				Result := ala
			else
				Result := library_access.adhoc_source.archetype_matching_ref (an_archetype_ref)
			end
		end

	archetype_parent_item (ala: ARCH_LIB_ARCHETYPE): detachable ARCH_LIB_ITEM
		do
			if not ala.is_specialised then
				Result := item_index.item (ala.semantic_parent_key.as_lower)
			else
				Result := archetype_matching_ref (ala.semantic_parent_key)
			end
		end

	last_stats_build_timestamp: DATE_TIME
			-- timestamp of stats build

	last_populate_timestamp: DATE_TIME
			-- timestamp of last populate or repopulate

feature -- Status Report

	valid_adhoc_path (a_full_path: STRING): BOOLEAN
			-- True if path is valid in adhoc repository
		do
			Result := library_access.adhoc_source.is_valid_path (a_full_path)
		end

	has_archetype_with_id (an_archetype_id: STRING): BOOLEAN
			-- True if the physical id `an_archetype_id' exists in library
		do
			Result := library_access.source.has_archetype_with_id (an_archetype_id) or else
				library_access.adhoc_source.has_archetype_with_id (an_archetype_id)
		end

	has_item_with_id (an_id: STRING): BOOLEAN
			-- True if `an_id', which may be for a class, archetype or other tree artefact
			-- exists in semantic index
		do
			Result := item_index.has (an_id.as_lower)
		end

	valid_candidate (ala: ARCH_LIB_ARCHETYPE): BOOLEAN
			-- True if `ala' does not exist in the library, but has a viable parent under
			-- which it can be attached
		do
			Result := has_parent_item (ala) and
				not has_item_with_id (ala.qualified_key)
		end

	has_archetype_matching_ref (an_archetype_ref: STRING): BOOLEAN
			-- Return true if there is an archetype whose id matches
		do
			Result := library_access.source.has_archetype_matching_ref (an_archetype_ref) or else
				library_access.adhoc_source.has_archetype_matching_ref (an_archetype_ref)
		end

	has_parent_item (ala: ARCH_LIB_ARCHETYPE): BOOLEAN
			-- Return true if a parent item can be found for `ala'
		do
			Result := attached archetype_parent_item (ala)
		end

feature -- Commands

	clear
			-- reduce to initial state
		do
			reset
			item_index.wipe_out
			item_tree.wipe_out
			compile_attempt_count := 0
			create last_populate_timestamp.make_from_epoch (0)
			reset_statistics
		end

	populate
			-- populate all indexes from library source
		do
			library_access.source.populate
			errors.append (library_access.source.errors)
			library_access.adhoc_source.populate
			populate_item_index
		end

feature -- Modification

	add_new_non_specialised_archetype (accn: ARCH_LIB_CLASS; an_archetype_id: ARCHETYPE_HRID; in_dir_path: STRING)
			-- create a new archetype of class represented by `accn' in path `in_dir_path'
		require
			Valid_id: has_rm_schema_for_archetype_id (an_archetype_id)
		do
			put_new_archetype (create {ARCH_LIB_ARCHETYPE}.make_new_archetype (an_archetype_id,
				library_access.source, in_dir_path))
		ensure
			has_item_with_id (an_archetype_id.physical_id)
		end

	add_new_specialised_archetype (parent_aca: ARCH_LIB_ARCHETYPE; an_archetype_id: ARCHETYPE_HRID; in_dir_path: STRING)
			-- create a new specialised archetype as child of archetype represented by `parent_aca' in path `in_dir_path'
		require
			Valid_id: has_rm_schema_for_archetype_id (an_archetype_id)
			Valid_parent: parent_aca.is_valid
		do
			check attached parent_aca.differential_archetype as parent_diff_arch then
				put_new_archetype (create {ARCH_LIB_ARCHETYPE}.make_new_specialised_archetype (an_archetype_id, parent_diff_arch,
					library_access.source, in_dir_path))
			end
		ensure
			has_item_with_id (an_archetype_id.physical_id)
		end

	add_new_template (parent_aca: ARCH_LIB_ARCHETYPE; an_archetype_id: ARCHETYPE_HRID; in_dir_path: STRING)
			-- create a new specialised archetype as child of archetype represented by `parent_aca' in path `in_dir_path'
		require
			Valid_id: has_rm_schema_for_archetype_id (an_archetype_id)
			Valid_parent: parent_aca.is_valid
		do
			check attached parent_aca.differential_archetype as parent_diff_arch then
				put_new_archetype (create {ARCH_LIB_ARCHETYPE}.make_new_template (an_archetype_id, parent_diff_arch,
					library_access.source, in_dir_path))
			end
		ensure
			has_item_with_id (an_archetype_id.physical_id)
		end

	last_added_archetype: detachable ARCH_LIB_ARCHETYPE
			-- archetype added by last call to `add_new_archetype' or `add_new_specialised_archetype'

	add_adhoc_archetype (a_path: STRING)
			-- Add the archetype designated by `a_path' to the ad hoc repository, and graft it into `directory'.
		require
			path_valid: valid_adhoc_path (a_path)
		do
			if item_index.is_empty then
				clone_item_tree_prototype
			end

			errors.wipe_out
			library_access.adhoc_source.put_archetype_from_file (a_path)
			errors.append (library_access.adhoc_source.errors)

			remove_list.wipe_out
			if attached library_access.adhoc_source.last_added_archetype as aca then
				try_put_archetype (aca)
				if not has_errors then
					last_added_archetype := aca
				end
			else
				add_error (ec_invalid_filename_e1, <<a_path>>)
			end
		end

	update_archetype_id (aca: ARCH_LIB_ARCHETYPE)
			-- move `ara' in tree according to its current and old ids
		require
			old_id_valid: attached aca.old_id as old_id and then has_archetype_with_id (old_id.physical_id) and then archetype_with_id (old_id.physical_id) = aca
			new_id_valid: not has_archetype_with_id (aca.id.physical_id)
			semantic_parent_exists: has_item_with_id (aca.semantic_parent_id)
		do
			if attached aca.old_id as att_old_id then
				item_index_remove (att_old_id)
				item_index_put (aca)

				if library_access.adhoc_source.has_archetype_with_id (att_old_id.physical_id) then
					library_access.adhoc_source.remove_archetype (att_old_id)
					library_access.adhoc_source.put_archetype (aca)
				else
					library_access.source.remove_archetype (att_old_id)
					library_access.source.put_archetype (aca)
				end
			end

			aca.parent.remove_child (aca)
			archetype_parent_item (aca).put_child (aca)
			aca.clear_old_semantic_parent_name
		ensure
			Node_added_to_archetype_index: has_archetype_with_id (aca.id.physical_id)
			Node_added_to_ontology_index: has_item_with_id (aca.id.physical_id)
			Node_parent_set: aca.parent.qualified_name.is_equal (aca.semantic_parent_id)
		end

	remove_artefact (aca: ARCH_LIB_ARCHETYPE)
			-- remove `aca' from indexes
		require
			new_id_valid: has_archetype_with_id (aca.id.physical_id)
			Semantic_parent_exists: has_item_with_id (aca.id.physical_id)
		do
			if aca.is_specialised and attached aca.parent as att_parent then
				att_parent.remove_child (aca)
			end
			item_index_remove (aca.id)

			if aca.is_adhoc then
				library_access.source.remove_archetype (aca.id)
			else
				library_access.adhoc_source.remove_archetype (aca.id)
			end
		ensure
			Node_removed_from_archetype_index: not has_archetype_with_id (aca.id.physical_id)
			Node_removed_from_semantic_index: not has_item_with_id (aca.id.physical_id)
			If_specialised_removed_from_parent: aca.is_specialised implies (attached aca.parent as att_parent and then not att_parent.has_child (aca))
		end

feature -- Traversal

	do_all_semantic (enter_action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ITEM]]; exit_action: detachable PROCEDURE [ANY, TUPLE [ARCH_LIB_ITEM]])
			-- On all nodes in `item_tree', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		do
			do_subtree (item_tree, enter_action, exit_action)
		end

	do_all_source (enter_action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ITEM]]; exit_action: detachable PROCEDURE [ANY, TUPLE [ARCH_LIB_ITEM]])
			-- On all nodes in `item_tree', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		do
			do_subtree (library_access.source.item_tree, enter_action, exit_action)
		end

	do_all_archetypes (action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]])
			-- On all archetype nodes, execute `action'
		do
			do_subtree (item_tree, agent do_if_archetype (?, action), Void)
		end

	do_archetypes (aci: ARCH_LIB_ITEM; action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]])
			-- Execute `action' on all archetypes found below `aci' in the tree
		do
			do_subtree (aci, agent do_if_archetype (?, action), Void)
		end

	do_if_archetype (aci: ARCH_LIB_ITEM; action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]])
			-- If `aci' is an archetype, perform `action' on it.
		do
			if attached {ARCH_LIB_ARCHETYPE} aci as aca then
				action.call ([aca])
			end
		end

	do_archetype_lineage (aca: ARCH_LIB_ARCHETYPE; action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ARCHETYPE]])
			-- On all archetype nodes from top to `aca', execute `action'
		local
			csr: detachable ARCH_LIB_ARCHETYPE
			lineage: ARRAYED_LIST [ARCH_LIB_ARCHETYPE]
		do
			create lineage.make (1)
			from csr := aca until csr = Void loop
				lineage.put_front (csr)
				csr := csr.specialisation_ancestor
			end
			lineage.do_all (action)
		end

feature -- Metrics

	archetype_count: INTEGER
			-- Count of all archetype descriptors in directory.
		do
			Result := library_access.source.archetype_count
		end

	template_count: INTEGER
			-- count of artefacts designated as templates or template_components
		do
			Result := library_access.source.template_count
		end

	compile_attempt_count: INTEGER
			-- Count of archetypes for which compiling has been attempted.

	update_compile_attempt_count
			-- Increment the count of archetypes for which parsing has been attempted.
		require
			can_increment: compile_attempt_count < archetype_count
		do
			compile_attempt_count := compile_attempt_count + 1
		ensure
			incremented: compile_attempt_count = old compile_attempt_count + 1
		end

	decrement_compile_attempt_count
			-- Decrement the count of archetypes for which parsing has been attempted.
		require
			can_decrement: compile_attempt_count > 0
		do
			compile_attempt_count := compile_attempt_count - 1
		ensure
			decremented: compile_attempt_count = old compile_attempt_count - 1
		end

feature -- Statistics

	has_statistics: BOOLEAN
			-- True if stats have been computed
		do
			Result := last_stats_build_timestamp > time_epoch
		end

	can_build_statistics: BOOLEAN
		do
			Result := compile_attempt_count = archetype_count
		end

	library_metrics: HASH_TABLE [INTEGER, STRING]

	terminology_bindings_statistics: HASH_TABLE [ARRAYED_LIST [STRING], STRING]
			-- table of archetypes containing terminology bindings, keyed by terminology;
			-- some archetypes have more than one binding, so could appear in more than one list

	reset_statistics
			-- Reset counters to zero.
		do
			create terminology_bindings_statistics.make (0)
			create stats.make (0)
			create library_metrics.make (Library_metric_names.count)
			Library_metric_names.do_all (
				agent (metric_name: STRING)
					do
						library_metrics.put (0, metric_name)
					end
			)
			create last_stats_build_timestamp.make_from_epoch (0)
		end

	build_detailed_statistics
		require
			can_build_statistics
		do
			if last_stats_build_timestamp < last_populate_timestamp then
				reset_statistics
				do_all_archetypes (agent gather_statistics)
				library_metrics.put (archetype_count, Total_archetype_count)
				create last_stats_build_timestamp.make_now
			end
		end

	stats: HASH_TABLE [ARCHETYPE_STATISTICAL_REPORT, STRING]
			-- table of aggregated stats, keyed by BMM_SCHEMA id to which the contributing archetypes relate
			-- (a single logical archetpe repository can contain archetypes of multiple RMs)

feature {NONE} -- Implementation

	item_index: HASH_TABLE [ARCH_LIB_ITEM, STRING]
			-- Index of archetype & class nodes, keyed by LOWER-CASE id. Used during construction of `directory'
			-- For class nodes, this will be model_publisher-closure_name-class_name, e.g. openehr-demographic-party.
			-- For archetype nodes, this will be the physical archetype id.
		attribute
			create Result.make (0)
		end

	item_index_put (ala: ARCH_LIB_ARCHETYPE)
		do
			item_index.force (ala, ala.qualified_key)
		end

	item_index_remove (arch_id: ARCHETYPE_HRID)
		do
			item_index.remove (arch_id.physical_id.as_lower)
		end

	populate_item_index
			-- Rebuild `archetype_index' and `item_index' from source repositories.
		do
			-- re-initialise the class tree if the schema has been reloaded since last time
			if schema_load_counter < rm_schemas_access.load_count then
				initialise_item_tree_prototype
			end

			clone_item_tree_prototype

			remove_list.wipe_out
			across library_access.source as arch_csr loop
				try_put_archetype (arch_csr.item)
			end

			-- process remove_list
			across remove_list as rem_item_csr loop
				library_access.source.remove_archetype (rem_item_csr.item)
			end

			create last_populate_timestamp.make_now
		end

	remove_list: ARRAYED_LIST [ARCHETYPE_HRID]
		attribute
			create Result.make (20)
		end

	try_put_archetype (aca: ARCH_LIB_ARCHETYPE)
		do
			if attached archetype_parent_item (aca) as att_parent_ala then
				if not has_item_with_id (aca.qualified_key) then
					att_parent_ala.put_child (aca)
					item_index_put (aca)
				else
					add_error (ec_arch_cat_dup_archetype, <<aca.source_file_path>>)
					remove_list.extend (aca.id)
				end
			else
				if aca.is_specialised then
					add_error (ec_arch_cat_orphan_archetype, <<aca.semantic_parent_key, aca.qualified_name>>)
				else
					add_error (ec_arch_cat_orphan_archetype_e2, <<aca.semantic_parent_key, aca.qualified_name>>)
				end
				remove_list.extend (aca.id)
			end
		end

	item_tree: ARCH_LIB_ARTEFACT_TYPE_ITEM
			-- The logical directory of archetypes, whose structure is derived directly from the
			-- reference model. The structure is a list of top-level packages, each containing
			-- an inheritance tree of first degree descendants of the LOCATABLE class.
			-- The contents of the structure consist of archetypes found in the reference and
			-- working repositories, and are subsequently attached into the structure.
			-- Archetypes opened adhoc are also grafted here.
		attribute
			create Result.make (Archetype_category)
		end

	item_tree_prototype: ARCH_LIB_ARTEFACT_TYPE_ITEM
			-- pure ontology structure created from RM schemas; to be used to create a copy for each refresh of the repository
			-- We use a CELL here because we only want one of these shared between all instances
		once
			create Result.make (Archetype_category)
		end

	initialise_item_tree_prototype
			-- rebuild `semantic_item_tree_prototype'
		local
			closure_node: ARCH_LIB_PACKAGE_ITEM
			rm_closure_name, qualified_rm_closure_key: STRING
			supp_list, supp_list_copy: ARRAYED_SET[STRING]
			supp_class_list: ARRAYED_LIST [BMM_CLASS]
			root_classes: ARRAYED_SET [BMM_CLASS]
			removed: BOOLEAN
			bmm_schema: BMM_SCHEMA
		do
			item_tree_prototype.wipe_out
			across rm_schemas_access.valid_top_level_schemas as top_level_schemas_csr loop
				bmm_schema := top_level_schemas_csr.item
				across bmm_schema.archetype_rm_closure_packages as rm_closure_packages_csr loop
					rm_closure_name := package_base_name (rm_closure_packages_csr.item)
					qualified_rm_closure_key := publisher_qualified_rm_closure_key (bmm_schema.rm_publisher, rm_closure_name)

					-- create new model node if not already in existence
					if item_tree_prototype.has_child_with_qualified_key (qualified_rm_closure_key) and then
						attached {ARCH_LIB_PACKAGE_ITEM} item_tree_prototype.child_with_qualified_key (qualified_rm_closure_key) as mn
					then
						closure_node := mn
					else
						create closure_node.make (rm_closure_name, bmm_schema)
						item_tree_prototype.put_child (closure_node)
					end

					-- obtain the top-most classes from the package structure; they might not always be in the top-most package
					check attached bmm_schema.package_at_path (rm_closure_packages_csr.item) as rm_closure_root_pkg then
						root_classes := rm_closure_root_pkg.root_classes
						if not root_classes.is_empty then
							-- create the list of supplier classes for all the classes in the closure root package
							create supp_list.make (0)
							supp_list.compare_objects
							across root_classes as root_classes_csr loop
								supp_list.merge (root_classes_csr.item.supplier_closure)
								supp_list.extend (root_classes_csr.item.name)
							end

							-- now filter this list to keep only those classes inheriting from the archetype_parent_class
							-- that are among the suppliers of the top-level class of the package; this gives the classes
							-- that could be archetyped in that package
							if attached bmm_schema.archetype_parent_class as apc then
								from supp_list.start until supp_list.off loop
									if not bmm_schema.is_descendant_of (supp_list.item, apc) then
										supp_list.remove
									else
										supp_list.forth
									end
								end
							end

							-- filter list list again so that only highest class in any inheritance subtree remains
							supp_list_copy := supp_list.deep_twin
							from supp_list.start until supp_list.off loop
								removed := False
								from supp_list_copy.start until supp_list_copy.off or removed loop
									if bmm_schema.is_descendant_of (supp_list.item, supp_list_copy.item) then
										supp_list.remove
										removed := True
									end
									supp_list_copy.forth
								end

								if not removed then
									supp_list.forth
								end
							end

							-- convert to BMM_CLASS_DESCRIPTORs
							create supp_class_list.make(0)
							across supp_list as supp_list_csr loop
								supp_class_list.extend (bmm_schema.class_definition (supp_list_csr.item))
							end
							add_child_nodes (rm_closure_name, supp_class_list, closure_node)
						end
					end
				end
			end
		end

	add_child_nodes (an_rm_closure_name: STRING; class_list: ARRAYED_LIST [BMM_CLASS]; a_parent_node: ARCH_LIB_MODEL_ITEM)
			-- populate child nodes of a node in library with immediate descendants of classes in `class_list'
			-- put each node into `item_index', keyed by `an_rm_closure_name' + '-' + `class_list.item.name',
			-- which will match with corresponding part of archetype identifier
		local
			children: ARRAYED_LIST [BMM_CLASS]
			class_node: ARCH_LIB_CLASS
		do
			across class_list as class_list_csr loop
				create class_node.make (an_rm_closure_name, class_list_csr.item)
				a_parent_node.put_child (class_node)
				children := class_list_csr.item.immediate_descendants
				add_child_nodes (an_rm_closure_name, children, class_node)
			end
		end

	clone_item_tree_prototype
			-- clone `item_tree_prototype' for use in an `item_tree'
		do
			item_index.wipe_out
			item_tree := item_tree_prototype.deep_twin
			do_all_semantic (agent (ari: attached ARCH_LIB_ITEM) do item_index.force (ari, ari.qualified_key) end, Void)
		end

	put_new_archetype (aca: ARCH_LIB_ARCHETYPE)
			-- put `aca' into the structure and into the library source structure
		require
			valid_candidate (aca)
		do
			check attached archetype_parent_item (aca) as att_ala then
				att_ala.put_child (aca)
			end
			item_index_put (aca)

			-- add to file system index
			library_access.source.put_archetype (aca)

			last_added_archetype := aca
		ensure
			Last_added_archetype_set: last_added_archetype = aca
			Archetype_in_index: item_index.item (aca.qualified_key) = aca
			Archetype_in_archetype_index: has_archetype_with_id (aca.id.physical_id)
		end

	schema_load_counter: INTEGER
			-- track loading of schemas; when changed, re-intialise the ontology prototype

	shifter: STRING
			-- debug indenter
		once
			create Result.make_empty
		end

	gather_statistics (aca: ARCH_LIB_ARCHETYPE)
			-- Update statistics counters from `aca'
		local
			terminologies: ARRAYED_LIST [STRING]
		do
			if aca.is_specialised then
				library_metrics.force (library_metrics.item (specialised_archetype_count) + 1, specialised_archetype_count)
			end
			if aca.has_slots then
				library_metrics.force (library_metrics.item (client_archetype_count) + 1, client_archetype_count)
			end
			if aca.is_supplier then
				library_metrics.force (library_metrics.item (supplier_archetype_count) + 1, supplier_archetype_count)
			end

			-- RM stats
			if aca.is_valid then
				library_metrics.force (library_metrics.item (valid_archetype_count) + 1, valid_archetype_count)

				terminologies := aca.differential_archetype.terminology.terminologies_available
				across terminologies as terminologies_csr loop
					if not terminology_bindings_statistics.has (terminologies_csr.item) then
						terminology_bindings_statistics.put (create {ARRAYED_LIST[STRING]}.make(0), terminologies_csr.item)
					end
					terminology_bindings_statistics.item (terminologies_csr.item).extend (aca.qualified_name)
				end

				aca.generate_statistics (True)
				if stats.has (aca.rm_schema.schema_id) then
					stats.item (aca.rm_schema.schema_id).merge (aca.statistical_analyser.stats)
				else
					stats.put (aca.statistical_analyser.stats.duplicate, aca.rm_schema.schema_id)
				end
			end
		end

	do_subtree (node: ARCH_LIB_ITEM; enter_action: PROCEDURE [ANY, TUPLE [ARCH_LIB_ITEM]]; exit_action: detachable PROCEDURE [ANY, TUPLE [ARCH_LIB_ITEM]])
			-- On `node', execute `enter_action', then recurse into its subnodes, then execute `exit_action'.
		do
			if attached node then
				enter_action.call ([node])
				if node.has_children then
					across node as child_csr loop
						do_subtree (child_csr.item, enter_action, exit_action)
					end
				end
				if attached exit_action then
					exit_action.call ([node])
				end
			end
		end

invariant
	parse_attempted_archetype_count_valid: compile_attempt_count >= 0 and compile_attempt_count <= archetype_count

end


