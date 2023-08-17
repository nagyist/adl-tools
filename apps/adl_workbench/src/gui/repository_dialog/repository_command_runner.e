note
	component:   "openEHR ADL Tools"
	description: "Class for running version control system commands asynchronously"
	keywords:    "ADL, archeytpes, openEHR"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class REPOSITORY_COMMAND_RUNNER

inherit
	SHARED_APP_UI_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	EVX_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_parent_dialog: REPOSITORY_DIALOG)
			-- make with reverse ref to owning dialog
		do
			parent_dialog := a_parent_dialog
			repository_action := agent do_nothing
		end

feature -- Actions

	do_action (a_rep_if: ARCHETYPE_REPOSITORY_INTERFACE; an_action: like repository_action;
		a_finalise_action: detachable PROCEDURE [ANY, TUPLE]; refresh_dialog_flag: BOOLEAN)
			-- perform action on repository
		require
			a_rep_if.has_repository_access
		do
			repository_interface := a_rep_if
			repository_action := an_action
			repository_finalise_action := a_finalise_action
			refresh_dialog := refresh_dialog_flag
			do_repository_action
		end

feature {NONE} -- Implementation

	ptr_style: detachable EV_POINTER_STYLE

	do_repository_action
			-- lauch repository action
		do
			-- set status update to agent that will do live update from to the grid status cell
			old_stdout_agent := stdout_agent
			set_stdout_agent (agent parent_dialog.update_grid_status)
			old_stderr_agent := stderr_agent
			set_stderr_agent (agent parent_dialog.update_grid_status)

			parent_dialog.ok_cancel_buttons.disable_sensitive

			ptr_style := parent_dialog.pointer_style
			parent_dialog.set_pointer_style ((create {EV_STOCK_PIXMAPS}).wait_cursor)

			repository_action.call ([])

			-- if it is an asynchronous call, it will have created a new process, so
			-- we wait and poll; if not, we go straight to the clean-up
			if not live_processes.is_empty then
				do_repository_action_poll_agent.set_interval (External_process_poll_period)
			else
				do_repository_action_finalise
			end
		end

	do_repository_action_poll_agent: EV_TIMEOUT
			-- Timer to check if process is still running
		once
			create Result
			Result.actions.extend (
				agent
					do
						if live_processes.is_empty then
							do_repository_action_poll_agent.set_interval (0)
							do_repository_action_finalise
						else
							do_repository_action_poll_agent.set_interval (External_process_poll_period)
						end
					end
			)
		end

	do_repository_action_finalise
		local
			info_dialog: EV_INFORMATION_DIALOG
			err_text: STRING
		do
			if last_command_result.succeeded then
				if attached repository_finalise_action as att_fin_action then
					att_fin_action.call ([])
				end
				if refresh_dialog then
					parent_dialog.populate_grid
				end
				if attached ptr_style as att_ps then
					parent_dialog.set_pointer_style (att_ps)
				end
			elseif last_command_result.did_not_run then
				if attached ptr_style as att_ps then
					parent_dialog.set_pointer_style (att_ps)
				end
				create info_dialog.make_with_text (get_msg ({ADL_MESSAGES_IDS}.ec_external_command_did_not_execute, Void))
				info_dialog.show_modal_to_window (parent_dialog)
			else
				if attached ptr_style as att_ps then
					parent_dialog.set_pointer_style (att_ps)
				end
				err_text := last_command_result.stderr

				-- if no error out (we test for that allowing for a \r\n non-empty string), then use
				-- the standard out.
				if err_text.count < 2 then
					err_text := last_command_result.stdout
				end
				create info_dialog.make_with_text (get_msg ({ADL_MESSAGES_IDS}.ec_external_command_failed, <<last_command_result.command_line, err_text>>))
				info_dialog.show_modal_to_window (parent_dialog)
			end

			-- reset command output
			if attached old_stdout_agent as att_agt then
				set_stdout_agent (att_agt)
			end
			if attached old_stderr_agent as att_agt then
				set_stderr_agent (att_agt)
			end
			parent_dialog.ev_live_status_text.set_text ("")

			parent_dialog.ok_cancel_buttons.enable_sensitive
		end

	old_stdout_agent: like stdout_agent

	old_stderr_agent: like stderr_agent

	repository_interface: detachable ARCHETYPE_REPOSITORY_INTERFACE

	repository_action: PROCEDURE [ANY, TUPLE]

	repository_finalise_action: detachable PROCEDURE [ANY, TUPLE]

	refresh_dialog: BOOLEAN
			-- if set True, repopulate main repository dialog

	parent_dialog: REPOSITORY_DIALOG

end


