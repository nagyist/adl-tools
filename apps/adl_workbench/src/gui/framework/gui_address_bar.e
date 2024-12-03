note
	component:   "openEHR ADL Tools"
	description: "Search control, occupying the 'address bar' position in the UI. Operates on whichever main tool is active."
	keywords:    "ADL workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	GUI_ADDRESS_BAR

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal
		end

	EVX_UTILITIES
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialization

	make
		do
			create client_controls.make (0)

			windows_hide_combo_dropdown_agent := agent nop
			windows_show_combo_dropdown_agent  := agent nop

			-- create controls
			create ev_root_container
			create ev_search_combo
			create ev_tool_bar
			create ev_search_button

			-- connect controls
			ev_root_container.extend (ev_search_combo)
			ev_root_container.extend (ev_tool_bar)
			ev_tool_bar.extend (ev_search_button)

			-- set visual characteristics
			ev_root_container.disable_item_expand (ev_tool_bar)
			ev_search_combo.set_tooltip ("Display or search for archetype id")
			ev_search_combo.set_minimum_width (400)
			ev_tool_bar.set_minimum_width (20)
			ev_tool_bar.set_minimum_height (20)
			ev_tool_bar.disable_vertical_button_style
			ev_search_button.set_tooltip ("Search for archetype id")
			ev_search_button.set_pixmap (get_icon_pixmap ("tool/magnifier"))

			-- set up events
			ev_search_combo.select_actions.extend (agent select_item_from_search_key)
			ev_search_combo.return_actions.extend (agent find_item_by_key)
			ev_search_button.select_actions.extend (agent start_search_by_id)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

	current_client: INTEGER
			-- object_id of currently active searchable GUI TOOL root widget

feature -- Status Report

	has_client_control (a_searchable_tool: GUI_SEARCHABLE_TOOL): BOOLEAN
		do
			Result := client_controls.has (a_searchable_tool.tool_unique_id)
		end

feature -- Modification

	set_agents (a_windows_hide_combo_dropdown_agent, a_windows_show_combo_dropdown_agent: like windows_hide_combo_dropdown_agent)
		do
			windows_hide_combo_dropdown_agent := a_windows_hide_combo_dropdown_agent
			windows_show_combo_dropdown_agent := a_windows_show_combo_dropdown_agent
		end

	add_client_control (a_searchable_tool: GUI_SEARCHABLE_TOOL)
			-- add `a_searchable_tool' to list of tools that this tools can search
		do
			client_controls.force (a_searchable_tool, a_searchable_tool.tool_unique_id)
			current_client := a_searchable_tool.tool_unique_id
		end

	remove_client_control (a_searchable_tool: GUI_SEARCHABLE_TOOL)
			-- remove `a_searchable_tool' to list of tools that this tools can search
		do
			client_controls.remove (a_searchable_tool.tool_unique_id)
			current_client := 0
		end

	set_current_client (a_searchable_tool: GUI_SEARCHABLE_TOOL)
		require
			has_client_control (a_searchable_tool)
		do
			current_client := a_searchable_tool.tool_unique_id
		end

feature -- Commands

	set_focus
			-- grab keyboard focus
		do
			ev_search_combo.set_focus
		end

	find_item_by_key
			-- Called by `return_actions' of `ev_search_combo'.
		local
			key: STRING
			matching_ids: ARRAYED_SET[STRING]
		do
			if is_windows and ev_search_combo.is_list_shown then
				client_controls.item (current_client).select_item_by_id (ev_search_combo.selected_text)
				windows_hide_combo_dropdown_agent.call ([ev_search_combo])

			else
				key := ev_search_combo.text
				if key.count > 0 then
					ev_search_combo.select_actions.block

					-- check if it is valid as is, e.g. created by slightly modifying currently displayed id
					if client_controls.item (current_client).valid_item_id (key) then
						client_controls.item (current_client).select_item_by_id (key)

					-- if it is a partial id, get a list of candidates
					elseif key.count >= 3 then
						matching_ids := client_controls.item (current_client).matching_ids (string_to_regex (key))

						if matching_ids.count = 0 then
							ev_search_combo.set_text (get_msg ({GENERAL_MESSAGES_IDS}.ec_no_match_found, Void))
							ev_search_combo.set_focus
							ev_search_combo.select_all

						else
							ev_search_combo.set_strings (matching_ids)
							if matching_ids.count = 1 then
								client_controls.item (current_client).select_item_by_id (ev_search_combo.text)
							else
								windows_show_combo_dropdown_agent.call ([ev_search_combo])
							end
						end

					else -- key too short
						ev_search_combo.set_text (get_msg ({GENERAL_MESSAGES_IDS}.ec_key_too_short, Void))
						ev_search_combo.set_focus
						ev_search_combo.select_all
					end

					ev_search_combo.select_actions.resume
				end
			end
		end

	select_item_from_search_key
			-- Called by `select_actions' of `ev_address_combo'.
			-- archetype_search_combo.text is guaranteed to be a valid archetype id, and one that is in the current repository
		do
			if not (is_windows and ev_search_combo.is_list_shown) then
				client_controls.item (current_client).select_item_by_id (ev_search_combo.text.as_string_8)
			end
		end

	start_search_by_id
			-- Called by `select_actions' of `search_button'.
		do
			ev_search_combo.wipe_out
			ev_search_combo.set_text (get_msg ({GENERAL_MESSAGES_IDS}.ec_enter_search_string, Void))
			ev_search_combo.set_focus
			ev_search_combo.select_all
		end

	find_next
		do
			client_controls.item (current_client).select_next
		end

	find_previous
		do
			client_controls.item (current_client).select_previous
		end

	clear
			-- Wipe out content from visual controls.
		do
			ev_search_combo.remove_text
		end

feature {NONE} -- Implementation

	string_to_regex (a_str: STRING): STRING
			-- turn an ordinary string like "abc" into a regex that can be used with standard regex matching
			-- libs like gobo
		do
			Result := ".*" + a_str + ".*"
		end

	ev_search_combo: EV_COMBO_BOX

	ev_tool_bar: EV_TOOL_BAR

	ev_search_button: EV_TOOL_BAR_BUTTON

	client_controls: HASH_TABLE [GUI_SEARCHABLE_TOOL, INTEGER]

	windows_hide_combo_dropdown_agent: PROCEDURE [ANY, TUPLE [EV_COMBO_BOX]]

	windows_show_combo_dropdown_agent: PROCEDURE [ANY, TUPLE [EV_COMBO_BOX]]

	nop (avcb: EV_COMBO_BOX)
		do
		end

end


