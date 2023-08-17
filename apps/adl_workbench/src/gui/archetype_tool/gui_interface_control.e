note
	component:   "openEHR ADL Tools"
	description: "Path map control and logic"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_INTERFACE_CONTROL

inherit
	GUI_ARCHETYPE_TARGETTED_TOOL
		redefine
			do_display
		end

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all;
			{ANY} has_current_library
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	ADL_2_TERM_CODE_TOOLS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	row_filter_names: ARRAYED_LIST [STRING]
			-- names of row filters of path control
		once
			create Result.make (0)
			Result.compare_objects
			Result.fill (<<"All", "Leaf">>)
		end

	path_column_names: ARRAY [STRING]
			-- names of columns of path view control
		once
			Result := <<"Path", "RM Type", "AOM Type">>
		end

	interface_column_names: ARRAY [STRING]
			-- names of columns of path view control
		once
			Result := <<"API Tag", "Path", "RM Type", "Is Multiple">>
		end

feature {NONE} -- Initialisation

	make (on_path_map_key_press_agent: PROCEDURE [ANY, TUPLE [EV_KEY]])
			-- create tree control repersenting archetype files found in repository_path
		do
			create ev_root_container
			create gui_controls.make (0)

			-- ================================== ADL 2 paths =======================================
			create evx_adl_2_tab.make (on_path_map_key_press_agent, agent path_column_names, agent path_list, agent row_filter_names, agent adl_2_path_row)
			evx_adl_2_tab.add_boolean_filter (get_text ({ADL_MESSAGES_IDS}.ec_nat_lang_checkbox_text), get_text ({ADL_MESSAGES_IDS}.ec_nat_lang_paths_tooltip),
				agent :BOOLEAN do Result := show_natural_language end, agent update_show_natural_language)
			ev_root_container.extend (evx_adl_2_tab.ev_root_container)
			ev_root_container.set_item_text (evx_adl_2_tab.ev_root_container, get_text ({ADL_MESSAGES_IDS}.ec_adl_2_paths_tab_text))
			gui_controls.extend (evx_adl_2_tab)

			-- ================================== ADL 1.4 paths =======================================
			create evx_adl_14_tab.make (on_path_map_key_press_agent, agent path_column_names, agent path_list, agent row_filter_names, agent adl_14_path_row)
			evx_adl_14_tab.add_boolean_filter (get_text ({ADL_MESSAGES_IDS}.ec_nat_lang_checkbox_text), get_text ({ADL_MESSAGES_IDS}.ec_nat_lang_paths_tooltip),
				agent :BOOLEAN do Result := show_natural_language end, agent update_show_natural_language)
			ev_root_container.extend (evx_adl_14_tab.ev_root_container)
			ev_root_container.set_item_text (evx_adl_14_tab.ev_root_container, get_text ({ADL_MESSAGES_IDS}.ec_adl_14_paths_tab_text))
			gui_controls.extend (evx_adl_14_tab)

			-- ================================== ADL interface tags =======================================
			create evx_interface_tab.make (on_path_map_key_press_agent, agent interface_column_names, agent path_list, agent row_filter_names, agent interface_row)
			ev_root_container.extend (evx_interface_tab.ev_root_container)
			ev_root_container.set_item_text (evx_interface_tab.ev_root_container, get_text ({ADL_MESSAGES_IDS}.ec_adl_interface_tab_text))
			gui_controls.extend (evx_interface_tab)

			ev_root_container.selection_actions.extend (agent on_select_notebook)
			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_NOTEBOOK

	show_natural_language: BOOLEAN

	selected_row: STRING
			-- return selected row text from currently visible tab
		do
			if evx_adl_2_tab.is_displayed then
				Result := evx_adl_2_tab.row_selected_text
			elseif evx_adl_14_tab.is_displayed then
				Result := evx_adl_14_tab.row_selected_text
			elseif evx_interface_tab.is_displayed then
				Result := evx_interface_tab.row_selected_text
			else
				create Result.make_empty
			end
		end

feature -- Commands

	select_path (a_path: STRING)
			-- select path `a_path' in ADL 2 control
		local
			search_path: STRING
		do
			check attached source end
			check attached selected_language end
			if show_natural_language then
				search_path := source.flat_archetype.annotated_path (a_path, selected_language, True)
			else
				search_path := a_path
			end
			evx_adl_2_tab.select_row (search_path)
			evx_adl_2_tab.show
		end

feature -- Events

	on_select_notebook
			-- Called by `selection_actions' of `archetype_notebook'.
		do
			do_display
		end

feature {NONE} -- Implementation

	gui_controls: ARRAYED_LIST [EVX_CONTROL_SHELL]

	evx_adl_2_tab: EVX_TABLE_CONTROL

	evx_adl_14_tab: EVX_TABLE_CONTROL

	evx_interface_tab: EVX_TABLE_CONTROL

	update_show_natural_language (a_flag: BOOLEAN)
		do
			show_natural_language := a_flag
		end

	do_display
			-- refresh visual controls
		do
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do if an_item.is_displayed then an_item.refresh end end)
		end

	do_clear
			-- wipe out content from controls
		do
			all_paths_cache := Void
			leaf_paths_cache := Void
			interface_paths_cache := Void
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.clear end)
		end

	do_populate
		do
			all_paths_cache := Void
			leaf_paths_cache := Void
			interface_paths_cache := Void
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do if an_item.is_displayed then an_item.populate end end)

			evx_adl_2_tab.resize_columns_proportional

			evx_adl_14_tab.resize_columns_proportional

			evx_interface_tab.resize_columns_proportional
		end

	adl_2_path_row (a_path: STRING): ARRAYED_LIST [STRING_32]
		do
			Result := adl_path_row (a_path, agent (s: STRING): STRING do Result := s end)
		end

	adl_14_path_row (a_path: STRING): ARRAYED_LIST [STRING_32]
		do
			Result := adl_path_row (a_path, agent (s: STRING): STRING do Result := adl_2_path_to_adl_14_path (s) end)
		end

	adl_path_row (a_path: STRING; conv_agt: FUNCTION [ANY, TUPLE [STRING], STRING]): ARRAYED_LIST [STRING_32]
			-- generate a row for the table consisting of path, RM type, AOM type
			-- use `conv_agt' to transform the path
		local
			co: C_OBJECT
			path_str: STRING
		do
			create Result.make (0)
			check attached source end
			check attached selected_language end

			-- first column: path
			if show_natural_language then
				path_str := safe_source.flat_archetype.annotated_path (a_path, selected_language, True)
			else
				path_str := a_path
			end
			Result.extend (utf8_to_utf32 (conv_agt.item ([path_str])))

			if source_archetype.has_object_path (a_path) then
				co := source_archetype.object_at_path (a_path)

				-- second column: RM type name
				Result.extend (utf8_to_utf32 (co.rm_type_name))

				-- third column: AOM type
				Result.extend (utf8_to_utf32 (co.generating_type.name))
			else
				-- second column: RM type name
				Result.extend ("")

				-- third column: AOM type
				Result.extend ("")
			end

			-- add an empty column to help display on all platforms
			Result.extend ("")
		end

	interface_row (a_path: STRING): ARRAYED_LIST [STRING_32]
		local
			co: C_OBJECT
			tag_str: STRING
		do
			create Result.make (0)
			if interface_paths.has (a_path) then
				check attached source end
				check attached selected_language end

				-- first column: interface tag
				check attached interface_paths.item (a_path) as att_tag then
					tag_str := att_tag
				end
				Result.extend (utf8_to_utf32 (tag_str))

				-- second column: path
				Result.extend (utf8_to_utf32 (a_path))

				if source_archetype.has_object_path (a_path) then
					co := source_archetype.object_at_path (a_path)
					-- third column: RM type name
					Result.extend (utf8_to_utf32 (co.rm_type_name))

					-- fourth column: multiplicity
					if attached co.parent as ca and then ca.is_multiple then
						Result.extend ("*")
					else
						Result.extend ("")
					end
				else
					Result.extend ("")
					Result.extend ("")
				end
			end
		end

	path_list (a_row_filter: STRING): ARRAYED_LIST [STRING]
		do
			if a_row_filter.is_equal (row_filter_names.i_th (1)) then
				Result := all_paths
			else
				Result := leaf_paths
			end
		end

	all_paths: ARRAYED_LIST[STRING]
		do
			if attached all_paths_cache as att_cache then
				Result := att_cache
			else
				Result := source_archetype.all_paths
				all_paths_cache := Result
			end
		end

	leaf_paths: ARRAYED_LIST[STRING]
		do
			if attached leaf_paths_cache as att_cache then
				Result := att_cache
			else
				Result := source_archetype.leaf_paths
				leaf_paths_cache := Result
			end
		end

	interface_paths: HASH_TABLE [STRING, STRING]
		do
			if attached interface_paths_cache as att_cache then
				Result := att_cache
			else
				check attached selected_language end
				Result := source_archetype.all_interface_tags (selected_language)
				interface_paths_cache := Result
			end
		end

	all_paths_cache: detachable ARRAYED_LIST[STRING]

	leaf_paths_cache: detachable ARRAYED_LIST[STRING]

	interface_paths_cache: detachable HASH_TABLE [STRING, STRING]

end


