note
	component:   "openEHR ADL Tools"
	description: "Dialog to ask for details for repository export"
	keywords:    "GUI, ADL, archetype"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	REPORT_DIALOG

inherit
	EV_DIALOG
		redefine
			initialize, create_interface_objects
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all;
			{ANY} standard_is_equal, deep_twin, is_deep_equal
		undefine
			is_equal, default_create, copy
		end

create
	make

feature -- Definitions

	Min_width_in_chars: INTEGER = 160

feature {NONE} -- Initialization

	make
		do
			default_create
		end

	create_interface_objects
			-- Initialize `Current'.
		local
			title_label: STRING
		do
			create gui_controls.make (0)

			Precursor {EV_DIALOG}

			-- create widgets
			create ev_root_container
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)

			-- ============ top label ============
			create ev_cell_1
			ev_cell_1.set_minimum_height (20)
			ev_root_container.extend (ev_cell_1)
			ev_root_container.disable_item_expand (ev_cell_1)

			create ev_label_1
			create title_label.make_from_string (get_text ({ADL_MESSAGES_IDS}.ec_report_description) + "%N")
			across builder.reports as rpts_csr loop
				title_label.append (rpts_csr.item.title + "%N")
			end
			ev_label_1.set_text (title_label)
			ev_root_container.extend (ev_label_1)
			ev_root_container.disable_item_expand (ev_label_1)

			create ev_cell_2
			ev_cell_2.set_minimum_height (20)
			ev_root_container.extend (ev_cell_2)
			ev_root_container.disable_item_expand (ev_cell_2)

			-- ============ input format ============
			create evx_input_frame.make (get_text ({ADL_MESSAGES_IDS}.ec_export_input_settings), True)
			ev_root_container.extend (evx_input_frame.ev_root_container)
			ev_root_container.disable_item_expand (evx_input_frame.ev_root_container)

			-- compile all first: check box
			evx_input_frame.add_row (False)
			create evx_compile_first_cb.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_export_compile_first_text), get_text ({ADL_MESSAGES_IDS}.ec_export_compile_first_tooltip),
				agent :BOOLEAN do Result := compile_all_first end, agent set_compile_all_first)
			evx_input_frame.extend (evx_compile_first_cb.ev_data_control, False)
			gui_controls.extend (evx_compile_first_cb)


			-- ============ output format ============
			create evx_output_frame.make (get_text ({ADL_MESSAGES_IDS}.ec_export_output_settings), False)
			ev_root_container.extend (evx_output_frame.ev_root_container)
			ev_root_container.disable_item_expand (evx_output_frame.ev_root_container)

			-- file format combo			
			create evx_format_cob.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_output_format_text), get_text ({ADL_MESSAGES_IDS}.ec_output_format_tooltip),
				agent :STRING do Result := output_format end, report_formats, agent set_output_format, Void, Void, 15)
			evx_output_frame.extend (evx_format_cob.ev_root_container, False)
			gui_controls.extend (evx_format_cob)

			-- ============ output directory ============
			create evx_dir_setter.make_linked (get_text ({ADL_MESSAGES_IDS}.ec_export_directory_text),
				agent :STRING do Result := output_directory end, agent set_output_directory, Void, Void, 0)
			evx_dir_setter.add_explore_button (agent show_in_system_explorer, get_icon_pixmap ("tool/magnifier"))
			evx_output_frame.extend (evx_dir_setter.ev_root_container, False)
			gui_controls.extend (evx_dir_setter)

			-- link to file format combo, so that selection of format changes directory
			evx_format_cob.add_linked_control (evx_dir_setter)

			-- ============ Console ============
			create ev_console
			ev_console.set_minimum_height (75)
			ev_console.disable_edit
			ev_root_container.extend (ev_console)

			-- ============ Bottom row - progress bar + Export / Ok / Cancel buttons ============
			create ev_bottom_row_hb
			ev_bottom_row_hb.set_border_width (default_border_width)
			ev_bottom_row_hb.set_padding_width (default_padding_width)
			ev_root_container.extend (ev_bottom_row_hb)
			ev_root_container.disable_item_expand (ev_bottom_row_hb)

			-- execution button
			create evx_run_button.make (get_text ({ADL_MESSAGES_IDS}.ec_run_report_button_text), get_text ({ADL_MESSAGES_IDS}.ec_run_report_button_text), Void,
				agent :BOOLEAN do Result := is_running end, agent do_export, 0, 0)
			evx_run_button.set_pixmaps (get_icon_pixmap ("tool/compile"), get_icon_pixmap ("tool/pause"))
			ev_bottom_row_hb.extend (evx_run_button.ev_data_control)
			ev_bottom_row_hb.disable_item_expand (evx_run_button.ev_data_control)
			gui_controls.extend (evx_run_button)

			-- progress bar
			create ev_progress_bar.default_create
			ev_progress_bar.set_foreground_color (Progress_bar_colour)
			ev_bottom_row_hb.extend (ev_progress_bar)

			-- Ok/Cancel buttons
			create ok_cancel_buttons.make (agent on_ok, agent on_cancel)
			ev_bottom_row_hb.extend (ok_cancel_buttons.ev_root_container)
			ev_bottom_row_hb.disable_item_expand (ok_cancel_buttons.ev_root_container)
		end

	initialize
		do
			precursor

			-- window characteristics
			set_title (get_text ({ADL_MESSAGES_IDS}.ec_export_library_dialog_title))
			set_icon_pixmap (adl_workbench_logo)
			set_minimum_width (Min_width_in_chars * Text_char_width)
			extend (ev_root_container)

			-- Set up Ok/ Cancel
			set_default_cancel_button (ok_cancel_buttons.cancel_button)
			set_default_push_button (ok_cancel_buttons.ok_button)

			-- set up agents in compiler and exporter
			archetype_compiler.set_progress_agents (agent initialise_progress_bar, agent set_progress_bar_current_value)
			archetype_compiler.set_new_state_change_listener (agent evx_run_button.populate)
			archetype_compiler.set_console_update_agent (agent update_console)

			builder.set_progress_agents (agent initialise_progress_bar, agent set_progress_bar_current_value)
			builder.set_new_state_change_listener (agent evx_run_button.populate)
			builder.set_console_update_agent (agent update_console)

			-- set up form for display
			enable_edit
			do_populate
		end

feature -- Events

	on_ok
		do
			do_finalise
			hide
		end

	on_cancel
		do
			do_finalise
			hide
		end

	do_export (go_requested: BOOLEAN)
		do
			if go_requested then
				do_execute
			else
				if execution_state = es_compiling then
					archetype_compiler.interrupt_build
				elseif execution_state = es_exporting then
					builder.interrupt_build
				end
			end
		end

feature -- Access

	output_format: STRING
		attribute
			Result := {ODIN_DEFINITIONS}.syntax_type_json
		end

	output_directory: STRING
		do
			if attached custom_output_directory as att_user_dir then
				Result := att_user_dir
			else
				Result := report_generation_directory
			end
		end

	custom_output_directory: detachable STRING
			-- True if user has changed export dir

	compile_all_first: BOOLEAN

	is_running: BOOLEAN
		do
			Result := execution_state = es_compiling and then archetype_compiler.is_building or else
				execution_state = es_exporting and then builder.is_building
		end

feature -- Commands

	enable_edit
			-- enable editing
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.enable_editable end)
		end

feature -- Events

	set_compile_all_first (val: BOOLEAN)
		do
			compile_all_first := val
			if compile_all_first then
				evx_run_button.set_labels (get_text ({ADL_MESSAGES_IDS}.ec_compile_button_text), get_text ({ADL_MESSAGES_IDS}.ec_compile_button_text))
			else
				evx_run_button.set_labels (get_text ({ADL_MESSAGES_IDS}.ec_export_button_text), get_text ({ADL_MESSAGES_IDS}.ec_export_button_text))
			end
			evx_run_button.populate
		end

	set_output_directory (a_dir: STRING)
		do
			custom_output_directory := a_dir
			execution_state := es_initial
			do_populate
		end

	set_output_format (a_str: STRING)
		do
			output_format := a_str
			execution_state := es_initial
			do_populate
		end

feature {NONE} -- Implementation

	execution_state: INTEGER

	es_initial: INTEGER = 0
	es_ready_to_compile: INTEGER = 1
	es_compiling: INTEGER = 2
	es_ready_to_export: INTEGER = 3
	es_exporting: INTEGER = 4
	es_completed: INTEGER = 5

	do_populate
			-- Set the dialog widgets from shared settings.
		do
			gui_controls.do_all (
				agent (an_item: EVX_DATA_CONTROL)
					do
						if an_item.is_show_requested then
							an_item.populate
						end
					end
			)
		end

	do_finalise
		do
			execution_state := es_initial
			ev_console.set_text ("")
			custom_output_directory := Void
		end

	do_execute
		local
			finished: BOOLEAN
		do
			from until finished loop
				-- do setup
				if execution_state = es_initial then
					if compile_all_first then
						archetype_compiler.setup_build ([False])
						execution_state := es_ready_to_compile
					else
						execution_state := es_ready_to_export
					end
					builder.setup_build ([output_directory, evx_format_cob.data_control_text])

				-- start compilation
				elseif execution_state = es_ready_to_compile then
					execution_state := es_compiling
					archetype_compiler.build_all
					if not archetype_compiler.is_interrupted then
						execution_state := es_ready_to_export
					else
						finished := True
					end

				-- start export
				elseif execution_state = es_ready_to_export then
					execution_state := es_exporting
					evx_run_button.set_labels (get_text ({ADL_MESSAGES_IDS}.ec_export_button_text), get_text ({ADL_MESSAGES_IDS}.ec_export_button_text))
					builder.build_all
					if not builder.is_interrupted then
						execution_state := es_completed
					else
						finished := True
					end

				-- restart after compilation phase interrupted
				elseif execution_state = es_compiling and then archetype_compiler.is_interrupted then
					archetype_compiler.resume_build
					if not archetype_compiler.is_interrupted then
						execution_state := es_completed
					else
						finished := True
					end

				-- restart after exporting phase interrupted
				elseif execution_state = es_exporting and then builder.is_interrupted then
					builder.resume_build
					if not builder.is_interrupted then
						execution_state := es_completed
					else
						finished := True
					end

				elseif execution_state = es_completed then
					execution_state := es_initial
					finished := True
				end
			end
		end

	initialise_progress_bar (a_max_val: INTEGER)
		do
			ev_progress_bar.value_range.resize_exactly (0, a_max_val)
		end

	set_progress_bar_current_value (a_val: INTEGER)
		do
			ev_progress_bar.set_value (a_val)
			ev_application.process_events
		end

	info_feedback (a_message: STRING)
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			create info_dialog.make_with_text (a_message)
			info_dialog.set_title ("Information")
			info_dialog.show_modal_to_window (Current)
		end

	update_console (a_text: STRING)
		do
			ev_console.append_text (a_text)
			ev_console.scroll_to_end
		end

	ev_cell_1, ev_cell_2: EV_CELL

	ev_label_1: EV_LABEL

	ev_root_container: EV_VERTICAL_BOX

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	evx_compile_first_cb: EVX_CHECK_BOX_CONTROL

	evx_dir_setter: EVX_DIRECTORY_SETTER

	evx_format_cob: EVX_COMBO_TEXT_SELECTOR_CONTROL

	ev_progress_bar: EV_HORIZONTAL_PROGRESS_BAR

	ev_bottom_row_hb: EV_HORIZONTAL_BOX

	evx_input_frame, evx_output_frame: EVX_FRAME_CONTROL

	evx_run_button: EVX_TOGGLE_BUTTON_CONTROL

	ok_cancel_buttons: EVX_OK_CANCEL_CONTROLS

	ev_console: EV_TEXT

	builder: ARCHETYPE_REPORTER
		once
			create Result.make
		end

	archetype_compiler: ARCHETYPE_COMPILER
			-- create own copy of archetype compiler
		once
			create Result.make
		end

end
