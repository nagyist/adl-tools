note
	component:   "openEHR ADL Tools"
	description: "Abstract idea of a GUI tool in docking arrangement"
	keywords:    "GUI, ADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class GUI_TOOL

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

	SHARED_GUI_AGENTS
		export
			{NONE} all
		end

feature -- Access

	source: detachable ANY
			-- source object to which this tool is targetted

	safe_source: attached like source
			-- attached form for convenient use when populated
		require
			is_populated
		do
			check attached source as att_source then
				Result := att_source
			end
		end

	ev_root_container: EV_CONTAINER
		deferred
		end

	last_populate_timestamp: DATE_TIME
			-- timestamp of last populate or repopulate
		attribute
			Result := Time_epoch
		end

	tool_unique_id: INTEGER
			-- unique id of this tool instance over the session
		do
			Result := ev_root_container.object_id
		end

	tool_artefact_id: STRING
			-- a system-wide unique artefact id that can be used to find a tool in a GUI collection like
			-- docked panes or similar
		require
			is_populated
		deferred
		end

	selection_history: detachable SELECTION_HISTORY

	selected_item: detachable IDENTIFIED_TOOL_ARTEFACT
		require
			is_selection_history_enabled
		do
			check attached selection_history then
				Result := selection_history.selected_item
			end
		end

	mini_tool_bar: detachable EV_WIDGET
		do
		end

feature -- Status Report

	can_populate (a_source: attached like source; a_params: detachable TUPLE): BOOLEAN
		do
			Result := True
		end

	can_repopulate: BOOLEAN
		do
			Result := is_populated
		end

	is_populated: BOOLEAN
		do
			Result := attached source
		end

	is_selection_history_enabled: BOOLEAN
		do
			Result := attached selection_history
		end

	has_sub_tool (a_tool: GUI_TOOL): BOOLEAN
			-- True if `a_tools' has already been attached via a call to `add_sub_tool'
		do
			Result := attached sub_tools and then sub_tools.has (a_tool)
		end

	can_edit: BOOLEAN
			-- True if this tool has editing capability
		do
			Result := False
		end

	editing_enabled: BOOLEAN
			-- True if this tool is in edit mode

feature -- Commands

	clear
			-- Wipe out content from visual controls and reset controls to reasonable state
		do
			do_clear
			last_populate_timestamp := Time_epoch
			source := Void
		ensure
			not is_populated
		end

	populate (a_source: attached like source; a_params: detachable TUPLE)
			-- populate the control by creating it from scratch
		require
			can_populate (a_source, a_params)
		do
			clear
			source := a_source
			do_populate
			create last_populate_timestamp.make_now
		ensure
			is_populated
		end

	repopulate
			-- repopulate from current data source and with current settings and display
		require
			can_repopulate: can_repopulate
		do
			do_populate
			create last_populate_timestamp.make_now
		end

	redisplay
			-- redisplay current view, with changed display settings
		require
			can_repopulate: can_repopulate
		do
			do_display
		end

	try_repopulate
			-- repopulate if possible; useful for buttons on tool that would cause live repopulate
		do
			if can_repopulate then
				repopulate
			end
		end

	enable_selection_history
		local
			a_sel_hist: like selection_history
		do
			create a_sel_hist.make
			set_selection_history (a_sel_hist)
		end

	set_selection_history (a_hist: like selection_history)
		do
			selection_history := a_hist
			if attached sub_tools then
				sub_tools.do_all (
					agent (a_tool: GUI_TOOL)
						do
							a_tool.set_selection_history (selection_history)
						end
				)
			end
		ensure
			is_selection_history_enabled
		end

	go_to_selected_item
			-- go to the item corresponding to the current selection in `history', if enabled
		do
		end

	enable_edit
			-- enable editing
		require
			can_edit
		do
			editing_enabled := True
		end

	disable_edit
			-- disable editing
		do
			editing_enabled := False
		end

feature {GUI_TOOL} -- Events

	on_selected
			-- processing required if this tool is visually selected, e.g. in a notebook
		do
		end

	on_rotate_view
			-- if there are multiple views available within one area, tat can be rotated with a tool-frame mini-control
		do
		end

feature {GUI_TOOL} -- Implementation

	do_clear
			-- clear visual controls
		deferred
		end

	do_populate
			-- populate visual controls from data source
		require
			is_populated
		deferred
		end

	do_display
			-- refresh visual controls
		do
		end

	ultimate_parent_tool: GUI_TOOL
			-- reference to tool at root of this tool
		do
			from Result := Current until Result.parent_tool = Void loop
				check attached Result.parent_tool as pt then
					Result := pt
				end
			end
		end

	parent_tool: detachable GUI_TOOL
			-- reference to parent tool

	sub_tools: detachable LIST [GUI_TOOL]
			-- list of subtools of this tool

	add_sub_tool (a_tool: GUI_TOOL)
		require
			not has_sub_tool (a_tool)
		do
			if not attached sub_tools then
				create {ARRAYED_LIST [GUI_TOOL]} sub_tools.make (0)
			end
			sub_tools.extend (a_tool)
			a_tool.set_parent_tool (Current)
			if attached selection_history then
			--	a_tool.set_selection_history (selection_history)
			end
		end

	do_all_sub_tools (tool_agt: PROCEDURE [ANY, TUPLE[GUI_TOOL]])
		do
			if attached sub_tools then
				across sub_tools as tool_csr loop
					tool_agt.call ([tool_csr.item])
				end
			end
		end

	set_parent_tool (a_tool: GUI_TOOL)
		do
			parent_tool := a_tool
		end

invariant
	Reverse_link_set: ev_root_container.data = Current

end


