note
	component:   "openEHR ADL Tools"
	description: "Slot map control - Visualise archetype ids matching slots"
	keywords:    "archetype, slot, gui"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2008- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_SLOT_MAP_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all;
			{ANY} has_current_library
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make (a_visual_update_action: PROCEDURE [ANY, TUPLE [INTEGER, INTEGER]])
		do
			-- create widgets
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- Slot fillers tree
			create slot_fillers_frame
			slot_fillers_frame.set_text (get_msg ({ADL_MESSAGES_IDS}.ec_slot_fillers_frame_text, Void))
			ev_root_container.extend (slot_fillers_frame)

			create slot_fillers_vbox
			slot_fillers_frame.extend (slot_fillers_vbox)

			create ev_slot_fillers_tree
			slot_fillers_vbox.extend (ev_slot_fillers_tree)

			ev_slot_fillers_tree.pointer_button_press_actions.extend (agent slot_fillers_tree_context_menu)

			-- Slot owners tree
			create slot_owners_frame
			slot_owners_frame.set_text (get_msg ({ADL_MESSAGES_IDS}.ec_slot_owners_frame_text, Void))
			ev_root_container.extend (slot_owners_frame)

			create slot_owners_vbox
			slot_owners_frame.extend (slot_owners_vbox)

			create ev_slot_owners_tree
			slot_owners_vbox.extend (ev_slot_owners_tree)
			ev_slot_owners_tree.pointer_button_press_actions.extend (agent slot_owners_tree_context_menu)

			-- set visual characteristics
			slot_fillers_vbox.set_border_width (Default_border_width)
			slot_owners_vbox.set_border_width (Default_border_width)

			visual_update_action := a_visual_update_action

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

	ev_slot_fillers_tree, ev_slot_owners_tree: EV_TREE

feature -- UI Feedback

	visual_update_action: PROCEDURE [ANY, TUPLE [INTEGER, INTEGER]]
			-- Called after processing each archetype (to perform GUI updates during processing).

feature {NONE} -- Implementation

	slot_fillers_vbox, slot_owners_vbox: EV_VERTICAL_BOX

	slot_fillers_frame, slot_owners_frame: EV_FRAME

	append_tree (subtree: EV_TREE_NODE_LIST; ids: ARRAYED_LIST [STRING])
			-- Populate `subtree' from `ids'.
		local
			eti: EV_TREE_ITEM
			ala: ARCH_LIB_ARCHETYPE
		do
			across ids as id_csr loop
				create eti.make_with_text (utf8_to_utf32 (id_csr.item))
				ala := current_library.archetype_with_id (id_csr.item)
				eti.set_pixmap (get_icon_pixmap ("archetype/" + ala.group_name))
				eti.set_data (ala)
				subtree.extend (eti)
			end
		ensure
			appended: subtree.count = old subtree.count + ids.count
		end

	do_clear
		do
			ev_slot_fillers_tree.wipe_out
			ev_slot_owners_tree.wipe_out
			call_visual_update_action (0, 0)
		end

	do_populate
			-- populate the ADL tree control by creating it from scratch
		local
			slots_count: INTEGER
			used_by_count: INTEGER
			slot_fillers_index: HASH_TABLE [ARRAYED_SET[STRING], STRING]
		do
			if attached source as src and attached selected_language as sel_lang then
				-- =============== SUPPLIERS ===============
				-- add valid slot fillers to suppliers
				if differential_view then
					slot_fillers_index := src.slot_fillers_index
				else
					slot_fillers_index := src.flat_slot_fillers_index
				end
				across slot_fillers_index as slots_csr loop
					create_slot_tree_node (src.differential_archetype.annotated_path (slots_csr.key, sel_lang, True))
					append_tree (ev_slot_tree_node, slots_csr.item)
					slots_count := slots_count + ev_slot_tree_node.count
					if ev_slot_tree_node.is_expandable then
						ev_slot_tree_node.expand
					end
				end

				-- =============== CLIENTS ===============
				if current_library.compile_attempt_count < current_library.archetype_count then
					ev_slot_owners_tree.extend (create {EV_TREE_ITEM}.make_with_text (get_text ({ADL_MESSAGES_IDS}.ec_slots_incomplete_w1)))
				end

				if attached src.slot_owners_index as ci then
					append_tree (ev_slot_owners_tree, ci)
					used_by_count := used_by_count + ev_slot_owners_tree.count
				end

				call_visual_update_action (slots_count, used_by_count)
			end
		end

	create_slot_tree_node (a_path: STRING)
		do
			create ev_slot_tree_node.make_with_text (utf8_to_utf32 (a_path))
			ev_slot_tree_node.set_pixmap (get_icon_pixmap ("archetype/slot_fillers"))
			ev_slot_fillers_tree.extend (ev_slot_tree_node)
		end

	ev_slot_tree_node: EV_TREE_ITEM
		attribute
			create Result
		end

	call_visual_update_action (val1, val2: INTEGER)
			-- Call `visual_update_action', if it is attached.
		do
			if attached visual_update_action then
				visual_update_action.call ([val1, val2])
			end
		end

	slot_fillers_tree_context_menu (x,y, button: INTEGER; x_tilt, y_tilt, pressure: DOUBLE; screen_x, screen_y: INTEGER)
			-- creates the context menu for a right click action for class node
		local
			context_menu: EV_MENU
		do
			if button = {EV_POINTER_CONSTANTS}.right and then attached ev_slot_fillers_tree.selected_item as att_sel_item then
				create context_menu
				build_context_menu (context_menu, utf32_to_utf8 (att_sel_item.text))
				context_menu.show
			end
		end

	slot_owners_tree_context_menu (x,y, button: INTEGER; x_tilt, y_tilt, pressure: DOUBLE; screen_x, screen_y: INTEGER)
			-- creates the context menu for a right click action for class node
		local
			context_menu: EV_MENU
		do
			if button = {EV_POINTER_CONSTANTS}.right and then attached ev_slot_owners_tree.selected_item as att_sel_item then
				create context_menu
				build_context_menu (context_menu, utf32_to_utf8 (att_sel_item.text))
				context_menu.show
			end
		end

	build_context_menu (a_menu: EV_MENU; an_archetype_key: STRING)
		local
			an_mi: EV_MENU_ITEM
		do
			if attached {ARCH_LIB_ARCHETYPE} current_library.archetype_matching_ref (an_archetype_key) as ext_ref_node then
				create an_mi.make_with_text_and_action (get_text ({ADL_MESSAGES_IDS}.ec_open_target_in_new_tab), agent gui_agents.call_select_archetype_in_new_tool_agent (ext_ref_node))
				an_mi.set_pixmap (get_icon_pixmap ("archetype/" + ext_ref_node.group_name))
				a_menu.extend (an_mi)
			end
		end

end


