note
	component:   "openEHR ADL Tools"
	description: "Root application class for any ADL application; performs all application-wide initialisation."
	keywords:    "application, shell"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class APP_ROOT

inherit
	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		undefine
			default_create
		end

	SHARED_ARCHETYPE_REPOSITORY_INTERFACES
		export
			{NONE} all
		undefine
			default_create
		end

	SHARED_ARCHETYPE_LIBRARY_INTERFACES
		export
			{NONE} all
		undefine
			default_create
		end

	SHARED_AOM_PROFILES_ACCESS
		export
			{NONE} all
		undefine
			default_create
		end

	EXTERNAL_TOOL_DEFINITIONS
		export
			{NONE} all
		undefine
			default_create
		end

	SHARED_ARCHETYPE_SERIALISERS
		export
			{NONE} all
		undefine
			default_create
		end

	-- FIXME: this is a hack to allow add_custom_dt_dynamic_type_from_string to be called, adding in some
	-- type correspondences that otherwise the runtime gets wrong if just INTERNAL.type_from_type_name() is used
	DT_TYPES
		export
			{NONE} all
		undefine
			default_create
		end

	SHARED_DT_OBJECT_CONVERTER
		export
			{NONE} all
		undefine
			default_create
		end

	SHARED_ARCHETYPE_COMPILER
		export
			{NONE} all
		undefine
			default_create
		end

	ANY_VALIDATOR
		rename
			validate as initialise_app,
			passed as cfg_file_initialised,
			ready_to_validate as ready_to_initialise_app
		redefine
			default_create, ready_to_initialise_app
		end

	SHARED_XML_RULES_FILE_ACCESS
		export
			{NONE} all
		undefine
			default_create, app_cfg_initialise, Default_application_name, Application_developer_name, Fallback_application_name, app_cfg
		end

feature -- Initialisation

	default_create
		do
			in_initial_state := True
		end

	initialise_shell
		require
			in_initial_state
		once
			-- see DT_TYPES note above; a hack needed to make string name -> type_id work for class names
			-- that clash with Eiffel type names
			add_custom_dt_dynamic_type_from_string (({C_STRING}).name, ({C_STRING}).type_id)
			add_custom_dt_dynamic_type_from_string (({C_DATE}).name, ({C_DATE}).type_id)

			-- add in ADL error message DB to main message DB
			message_db.add_table (create {ADL_MESSAGES_DB}.make)
			message_db.add_table (create {DT_MESSAGES_DB}.make)
			message_db.add_table (create {ODIN_MESSAGES_DB}.make)
			message_db.add_table (create {BMM_MESSAGES_DB}.make)
			message_db.add_table (create {GENERAL_MESSAGES_DB}.make)

			-- set up XML serialiser rules file
			set_xml_load_rules_agent

			initialise_serialisers

			shell_initialised := True
		ensure
			shell_initialised
		end

	initialise_cfg
		require
			shell_initialised
		once
			reset
			if app_cfg.errors.has_errors then
				merge_errors (app_cfg.errors)
			end

			if not has_errors then
				cfg_file_initialised := True
			end
		ensure
			cfg_file_initialised or initialisation_failed
		end

	initialise_app
		local
			term_init: XML_TERMINOLOGY_SERVICE_POPULATOR
			dead_repos: ARRAYED_LIST [STRING]
			dead_schema_dirs: ARRAYED_LIST [STRING]
			dir: DIRECTORY
		once
			-- set error reporting level in billboard and all error accumulator objects
			set_global_error_reporting_level (error_reporting_level)

			--
			-- if app config dir does not exist, create it
			--
			if not file_system.directory_exists (user_config_file_directory) then
				-- TODO: revert when original call no longer causes OS faults
				-- file_system.recursive_create_directory (user_config_file_directory)
				create dir.make (user_config_file_directory)
				dir.recursive_create_dir
			end

			--
			-- check if found an XML rules file, and copy in sample one if none
			--
			if not file_system.file_exists (xml_rules_file_path) and not file_system.file_exists (Default_xml_rules_file_path) then
				if file_system.file_exists (xml_rules_sample_file_path) then
					file_system.copy_file (xml_rules_sample_file_path, xml_rules_file_path)
				else
					add_warning ({GENERAL_MESSAGES_IDS}.ec_xml_rules_sample_file_missing, <<xml_rules_sample_file_path>>)
				end
			end

			--
			-- set up the RM schemas
			--
			if rm_schema_directories.is_empty then
				add_rm_schema_directory (Default_rm_schema_directory)
				if not file_system.directory_exists (Default_rm_schema_directory) then
					file_system.recursive_create_directory (Default_rm_schema_directory)

					-- alternative to above line if OS faults cause problems e.g. on Mac/Parallels
					-- create dir.make (Default_rm_schema_directory)
					-- dir.recursive_create_dir
				end
			end
			create dead_schema_dirs.make (0)
			dead_schema_dirs.compare_objects

			-- get rid of any non-existent schema directories
			across rm_schema_directories as sch_dirs loop
				if not file_system.directory_exists (sch_dirs.item) then
					add_warning ({BMM_MESSAGES_IDS}.ec_bmm_schema_dir_not_valid, <<sch_dirs.item>>)
					dead_schema_dirs.extend (sch_dirs.item)
				end
			end
			across dead_schema_dirs as dead_sch_csr loop
				rm_schema_directories.prune_all (dead_sch_csr.item)
			end

			bmm_models_access.initialise_with_load_list (rm_schema_directories, rm_schemas_load_list)
			if not bmm_models_access.found_valid_models then
				if repository_resources.is_empty then
					add_warning ({BMM_MESSAGES_IDS}.ec_bmm_schemas_config_not_valid, <<bmm_models_access.schemas_load_list_string>>)
				else
					add_error ({BMM_MESSAGES_IDS}.ec_bmm_schemas_config_not_valid, <<bmm_models_access.schemas_load_list_string>>)
				end
			end

			--
			-- set up the AOM profiles
			--
			if file_system.directory_exists (aom_profile_directory) then
				aom_profiles_access.initialise (aom_profile_directory)

				if not aom_profiles_access.found_valid_profiles then
					merge_errors (aom_profiles_access.errors)
				else
					-- make sure it is in the cfg file
					if aom_profile_user_directory.is_empty then
						set_aom_profile_user_directory (aom_profile_directory)
					end
				end
			else
				add_error ({ADL_MESSAGES_IDS}.ec_aom_profile_dir_not_valid, <<aom_profile_directory>>)
			end

			-- process repositories and validate; determine setting for `current_library' if
			-- saved library name no longer valid, or else never set
			if not has_errors then
				-- first of all check for broken repositories and get rid of them
				create dead_repos.make (0)
				across repository_resources as repos_csr loop
					if repos_csr.item.is_empty or else not directory_exists (repos_csr.item) or else not
						archetype_repository_interfaces.repository_exists_at_path (repos_csr.item)
					then
						dead_repos.extend (repos_csr.item)
					end
				end
				across dead_repos as repos_csr loop
					add_warning ({ADL_MESSAGES_IDS}.ec_remove_library_cfg, <<get_msg ({ADL_MESSAGES_IDS}.ec_ref_library_not_found, <<repos_csr.item>>)>>)
					repository_resources.remove_repository (repos_csr.item)
				end

				-- populate existing repositories, if any
				across repository_resources as repos_csr loop
					if is_vcs_checkout_area (repos_csr.item) and archetype_repository_interfaces.repository_exists_at_path (repos_csr.item) then
						archetype_repository_interfaces.extend_associate_with_remote (repos_csr.item)
						if not archetype_repository_interfaces.last_repository_interface.has_repository_tool then
							add_warning ({ADL_MESSAGES_IDS}.ec_repository_tool_unavailable, <<archetype_repository_interfaces.last_repository_interface.repository_type>>)
						end
					else
						archetype_repository_interfaces.extend (repos_csr.item)
					end
				end

				-- forget current library if it no longer exists
				if not archetype_library_interfaces.has (current_library_name) then
					forget_current_library_name
				end

				-- now choose a library to start with
				if not archetype_library_interfaces.is_empty then
					if not has_current_library then
						set_current_library_name (archetype_library_interfaces.keys.first)
					end
					use_current_library (False)
				end

				-- tell the user a few useful things
				if validation_strict then
					add_info ({ADL_MESSAGES_IDS}.ec_validation_strict, Void)
				else
					add_info ({ADL_MESSAGES_IDS}.ec_validation_non_strict, Void)
				end
			end

			-- initialise terminology
			if terminology_directory.is_empty then
				set_terminology_directory (Default_terminology_directory)
			end
			create term_init.make
			if term_init.init_failed then
				add_error ({ADL_MESSAGES_IDS}.ec_terminology_init_failed, <<term_init.init_fail_reason>>)
			end

			if not has_errors then
				app_initialised := True
			end
		end

feature -- Status Report

	initialisation_failed: BOOLEAN
		do
			Result := has_errors
		end

	in_initial_state: BOOLEAN

	shell_initialised: BOOLEAN

	app_initialised: BOOLEAN

	ready_to_initialise_app: BOOLEAN
		do
			Result := cfg_file_initialised
		end

feature -- Modification

	set_custom_config_file_path (a_path: STRING)
		do
			custom_config_file_path.wipe_out
			custom_config_file_path.append (a_path)
		end

end



