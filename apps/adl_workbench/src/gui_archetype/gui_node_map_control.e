note
	component:   "openEHR Archetype Project"
	description: "Node map control - Visualise an archetype structure as a node map"
	keywords:    "archetype, cadl, gui"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWBPR"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class GUI_NODE_MAP_CONTROL

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		end

	SPECIALISATION_STATUSES
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	SHARED_KNOWLEDGE_REPOSITORY

	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_main_window: attached MAIN_WINDOW)
		do
			gui := a_main_window
			gui_tree := gui.node_map_tree

			in_technical_mode := show_technical_view
			in_reference_model_mode := show_reference_model_view
			if in_reference_model_mode then
				gui.node_map_reference_model_radio_button.enable_select
			elseif in_technical_mode then
				gui.node_map_technical_radio_button.enable_select
			else
				gui.node_map_domain_radio_button.enable_select
			end
		ensure
			gui_set: gui = a_main_window
		end

feature -- Status Report

	in_technical_mode: BOOLEAN
			-- If True, show more technical detail on each node

	in_reference_model_mode: BOOLEAN
			-- True if reference model should be visible in tree

	in_reference_model_mode_changed: BOOLEAN
			-- True if last call to set/unset in_reference_model_mode changed the flag's value

	is_expanded: BOOLEAN
			-- True if last whole tree operation was expand

feature -- Commands

	set_domain_mode
			-- View only domain names; Set `in_technical_mode' off.
		do
			in_technical_mode := False
			set_show_technical_view (False)

			in_reference_model_mode_changed := in_reference_model_mode
			in_reference_model_mode := False
			set_show_reference_model_view (False)

			repopulate
		end

	set_technical_mode
			-- View domain names + RM classes; Set `in_technical_mode' on.
		do
			in_technical_mode := True
			set_show_technical_view (True)

			in_reference_model_mode_changed := in_reference_model_mode
			in_reference_model_mode := False
			set_show_reference_model_view (False)

			repopulate
		end

	set_reference_model_mode
			-- View domain names + RM classes + other RM attributes; Set `in_technical_mode' on, `in_reference_model_mode' on.
		do
			in_technical_mode := True
			set_show_technical_view (True)

			in_reference_model_mode_changed := not in_reference_model_mode
			in_reference_model_mode := True
			set_show_reference_model_view (True)

			repopulate
		end

	clear
		do
			gui_tree.wipe_out
		end

	populate
			-- build definition / ontology cross reference tables used for validation and
			-- other purposes
		require
			has_current_profile
		local
			a_c_iterator: C_VISITOR_ITERATOR
			c_node_map_builder: C_GUI_NODE_MAP_BUILDER
		do
			clear
			create tree_item_stack.make (0)
			create gui_node_map.make(0)

			if current_arch_cat.has_validated_selected_archetype then
				-- get the archetype
				if differential_view then
					target_archetype := current_arch_cat.selected_archetype.differential_archetype
				else
					target_archetype := current_arch_cat.selected_archetype.flat_archetype
				end
				rm_schema := current_arch_cat.selected_archetype.rm_schema

				-- populate from definition
				create c_node_map_builder
				c_node_map_builder.initialise (target_archetype, current_language, gui_tree, in_technical_mode, False, gui_node_map)
				create a_c_iterator.make (target_archetype.definition, c_node_map_builder)
				a_c_iterator.do_all

				-- add RM attributes if in RM mode
				if in_reference_model_mode then
					gui_tree.recursive_do_all (agent node_add_rm_attributes (?))
				end

				-- populate from invariants
				populate_invariants

				-- make visualisation adjustments
				is_expanded := not expand_node_tree
				toggle_expand_tree

				if not differential_view then
					roll_up_to_specialisation_level
				end
			end
		end

	repopulate
		require
			has_current_profile
		local
			a_c_iterator: C_VISITOR_ITERATOR
			c_node_map_builder: C_GUI_NODE_MAP_BUILDER
		do
			-- repopulate from definition
			create c_node_map_builder
			c_node_map_builder.initialise (target_archetype, current_language, gui_tree, in_technical_mode, True, gui_node_map)
			create a_c_iterator.make (target_archetype.definition, c_node_map_builder)
			a_c_iterator.do_all

			-- update reference mode nodes
			if in_reference_model_mode_changed then
				if in_reference_model_mode then
					gui_tree.recursive_do_all (agent node_add_rm_attributes (?))
				else
					gui_tree.recursive_do_all (agent node_remove_rm_attributes (?))
				end
				in_reference_model_mode_changed := False
			end
		end

	item_select
			-- Do something when an item is selected.
		do
			if attached {C_COMPLEX_OBJECT} gui_tree.selected_item.data as c_c_o then
				if c_c_o.is_addressable then
					gui.ontology_controls.select_term(c_c_o.node_id)
				end

			elseif attached {CONSTRAINT_REF} gui_tree.selected_item.data as c_r then
				gui.ontology_controls.select_constraint(c_r.target)

			elseif attached {ORDINAL} gui_tree.selected_item.data as ord then
				if ord.symbol.terminology_id.is_local then
					gui.ontology_controls.select_term(ord.symbol.code_string)
				end

			elseif attached {STRING} gui_tree.selected_item.data as str and then is_valid_code (str) then
				if ontology.has_term_code (str) then
					gui.ontology_controls.select_term (str)
				end
			end
		end

	toggle_expand_tree
			-- Expand or shrink the tree control.
		do
			is_expanded := not is_expanded

			if is_expanded then
				gui_tree.recursive_do_all (agent ev_tree_item_expand)
				gui.node_map_expand_button.set_text ("Collapse All")
			else
				gui_tree.recursive_do_all (agent ev_tree_item_shrink)
				gui.node_map_expand_button.set_text ("Expand All")
			end
		end

	shrink_to_level (a_type: STRING)
			-- Shrink the tree control up to items of type `a_type'.
		do
			gui_tree.recursive_do_all (agent ev_tree_item_shrink_to_level (a_type, ?))
		end

	expand_one_level
			-- Expand the tree control one level further.
		do
			create node_list.make (0)
			gui_tree.recursive_do_all (agent ev_tree_item_expand_one_level)

			from node_list.start until node_list.off loop
				node_list.item.expand
				node_list.forth
			end
		end

	shrink_one_level
			-- Shrink the tree control one level further.
		do
			create node_list.make (0)
			gui_tree.recursive_do_all (agent ev_tree_item_collapse_one_level)

			from node_list.start until node_list.off loop
				node_list.item.collapse
				node_list.forth
			end
		end

	roll_up_to_specialisation_level
			-- roll the tree up so that nodes whose rolled_up_specialisation_status is
			-- ss_inherited are closed, but nodes with
		require
			archetype_selected: current_arch_cat.has_validated_selected_archetype
		do
			if target_archetype.is_specialised and not target_archetype.is_template then
				create node_list.make(0)
				gui_tree.recursive_do_all(agent ev_tree_item_roll_up(?))

				from node_list.start until node_list.off loop
					node_list.item.collapse
					node_list.forth
				end
			end
		end

feature {NONE} -- Implementation

	rm_schema: BMM_SCHEMA

	target_archetype: attached ARCHETYPE
			-- Differential or flat version of archetype, depending on setting of `differential_view'.

	ontologies: ARRAYED_STACK [ARCHETYPE_ONTOLOGY]
			-- we use a stack here to handle ontologies inside operational templates

	ontology: attached ARCHETYPE_ONTOLOGY
			-- The ontology for `target_archetype'.
		require
			ontologies_attached: attached ontologies
			ontologies_has_item: not ontologies.off
		do
			Result := ontologies.item
		ensure
			has_language: current_arch_cat.has_validated_selected_archetype implies Result.has_language (current_language)
		end

	gui: MAIN_WINDOW
			-- main window of system

	gui_tree: EV_TREE

	gui_node_map: HASH_TABLE [EV_TREE_ITEM, ARCHETYPE_CONSTRAINT]
			-- xref table from archetype definition nodes to GUI nodes (note that some C_X
			-- nodes have child GUI nodes; the visitor takes care of the details)

	tree_item_stack: ARRAYED_STACK[EV_TREE_ITEM]

	node_add_rm_attributes (a_tree_node: attached EV_TREE_NODE)
		local
			pixmap: EV_PIXMAP
			props: HASH_TABLE [BMM_PROPERTY_DEFINITION, STRING]
			attr_ti: EV_TREE_ITEM
		do
			if attached {EV_TREE_ITEM} a_tree_node as a_ti and then attached {C_COMPLEX_OBJECT} a_ti.data as c_c_o then
				if rm_schema.has_class_definition (c_c_o.rm_type_name) then
					if differential_view then
						props := rm_schema.class_definition (c_c_o.rm_type_name).properties
					else
						props := rm_schema.class_definition (c_c_o.rm_type_name).flat_properties
					end
					from props.start until props.off loop
						if not c_c_o.has_attribute (props.key_for_iteration) then
							pixmap := pixmaps.item (rm_attribute_pixmap_string (props.item_for_iteration))
							create attr_ti.make_with_text (utf8 (props.key_for_iteration + ": " + props.item_for_iteration.type_def.as_type_string))
							attr_ti.set_data (props.item_for_iteration)
							attr_ti.set_pixmap (pixmap)
							a_tree_node.extend (attr_ti)
						end
						props.forth
					end
				end
			end
		end

	node_remove_rm_attributes (a_tree_node: attached EV_TREE_NODE)
		do
			if attached {C_COMPLEX_OBJECT} a_tree_node.data as c_c_o then
				from a_tree_node.start until a_tree_node.off loop
					if attached {BMM_PROPERTY_DEFINITION} a_tree_node.item.data as a_bmm_prop then
						a_tree_node.remove
					else
						a_tree_node.forth
					end
				end
			end
		end

	ev_tree_item_expand (an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if an_ev_tree_node.is_expandable then -- and node_data.is_addressable then
				an_ev_tree_node.expand
			end
		end

	ev_tree_item_shrink(an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if an_ev_tree_node.is_expandable then -- and node_data.is_addressable then
				an_ev_tree_node.collapse
			end
		end

	ev_tree_item_shrink_to_level (a_level: attached STRING; an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if attached an_ev_tree_node.data then
				if attached {C_ATTRIBUTE} an_ev_tree_node.data and an_ev_tree_node.is_expandable then
					an_ev_tree_node.expand
				elseif an_ev_tree_node.is_expandable then
					if a_level.is_equal("addressable") then
						if attached {C_COMPLEX_OBJECT} an_ev_tree_node as an_obj_node and then an_obj_node.is_addressable then
							an_ev_tree_node.expand
						else
							an_ev_tree_node.collapse
						end
					elseif a_level.is_equal("anonymous") then
						if attached {C_COMPLEX_OBJECT} an_ev_tree_node then
							an_ev_tree_node.expand
						else
							an_ev_tree_node.collapse
						end
					elseif a_level.is_equal("simple") then
						an_ev_tree_node.expand
					end
				end
			end
		end

	ev_tree_item_expand_one_level (an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if an_ev_tree_node.is_expanded then
				from an_ev_tree_node.start until an_ev_tree_node.off loop
					if an_ev_tree_node.item.is_expandable and then not an_ev_tree_node.item.is_expanded then
						node_list.extend (an_ev_tree_node.item)
					end
					an_ev_tree_node.forth
				end
			elseif an_ev_tree_node = gui_tree.item then
				node_list.extend (an_ev_tree_node)
			end
		end

	ev_tree_item_collapse_one_level (an_ev_tree_node: attached EV_TREE_NODE)
			--
		do
			if an_ev_tree_node.is_expanded then
				from an_ev_tree_node.start until an_ev_tree_node.off or else (an_ev_tree_node.item.is_expandable and then an_ev_tree_node.item.is_expanded) loop
					an_ev_tree_node.forth
				end

				if an_ev_tree_node.off then -- didn't find any expanded children
					node_list.extend (an_ev_tree_node)
				end
			end
		end

	ev_tree_item_roll_up (an_ev_tree_node: attached EV_TREE_NODE)
			-- close nodes that have rolled_up_specialisation_status = ss_inherited; open others
		do
			if an_ev_tree_node.is_expandable then
				if attached {ARCHETYPE_CONSTRAINT} an_ev_tree_node.data as ac then
					if ac.rolled_up_specialisation_status.value = ss_inherited then
						an_ev_tree_node.collapse
					else
						an_ev_tree_node.expand
					end
				end
			end
		end

	node_list: ARRAYED_LIST [EV_TREE_NODE]

	rm_attribute_pixmap_string (rm_attr: attached BMM_PROPERTY_DEFINITION): attached STRING
			-- string name of pixmap for attribute rm_attr
		do
			create Result.make_empty
			Result.append ("C_ATTRIBUTE")
			if rm_attr.is_container then
				Result.append (".multiple")
			end
			if not rm_attr.is_mandatory then
				Result.append (".optional")
			end
			Result.append (".reference_model")
		end

	object_invariant_string (an_inv: attached ASSERTION): attached STRING
			-- generate string form of node or object for use in tree node
		do
			Result := an_inv.as_string

			if not in_technical_mode then
				Result := ontology.substitute_codes (Result, current_language)
			end
		end

	populate_invariants
			-- populate invariants of archetype into bottom nodes of tree
		local
			a_ti_sub, a_ti_sub2: EV_TREE_ITEM
			invariants: ARRAYED_LIST[ASSERTION]
			s: STRING
		do
			if target_archetype.has_invariants then
				invariants := target_archetype.invariants
				create a_ti_sub.make_with_text ("invariants:")
				a_ti_sub.set_pixmap(pixmaps.item ("CADL_INVARIANT"))
				gui_tree.extend (a_ti_sub)

				from invariants.start until invariants.off loop
					create s.make_empty

					if invariants.item.tag /= Void then
						s.append (invariants.item.tag + ": ")
					end

					s.append (object_invariant_string (invariants.item))
					create a_ti_sub2.make_with_text (utf8 (s))
					a_ti_sub2.set_pixmap (pixmaps.item ("CADL_INVARIANT_ITEM"))
					a_ti_sub2.set_data (invariants.item)
					a_ti_sub.extend (a_ti_sub2)
					invariants.forth
				end

				-- FIXME: TO BE IMPLEM - need to add sub nodes for each assertion
			end
		end

	ev_tree_do_all(node_enter_action, node_exit_action: attached PROCEDURE[ANY, TUPLE [EV_TREE_NODE]])
			-- do enter_action and exit_action to all nodes in the structure
		do
			from gui_tree.start until gui_tree.off loop
				ev_tree_do_all_nodes (gui_tree.item, node_enter_action, node_exit_action)
				gui_tree.forth
			end
		end

	ev_tree_do_all_nodes(a_target: attached EV_TREE_NODE; node_enter_action, node_exit_action: PROCEDURE[ANY, TUPLE [EV_TREE_NODE]])
		do
			node_enter_action.call ([a_target])
			from a_target.start until a_target.off loop
				ev_tree_do_all_nodes (a_target.item, node_enter_action, node_exit_action)
				a_target.forth
			end
			node_exit_action.call ([a_target])
		end

invariant
	Three_value_logic: in_reference_model_mode implies in_technical_mode

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is adl_node_map_control.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|