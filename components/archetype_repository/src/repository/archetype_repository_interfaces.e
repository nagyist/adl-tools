note
	component:   "openEHR ADL Tools"
	description: "Set of archetype repositories read by tool at startup"
	keywords:    "ADL, archetype, repository"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_REPOSITORY_INTERFACES

inherit
	SHARED_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, directory_exists
		end

	TABLE_ITERABLE [ARCHETYPE_REPOSITORY_INTERFACE, STRING]

create
	make

feature -- Initialisation

	make
		do
			create repositories.make (0)
		end

feature -- Access

	item (a_repo_path: STRING): ARCHETYPE_REPOSITORY_INTERFACE
		require
			has (a_repo_path)
		do
			check attached repositories.item (a_repo_path) as att_repo_if then
				Result := att_repo_if
			end
		end

feature -- Status Report

	has (a_repo_key: STRING): BOOLEAN
		do
			Result := repositories.has (a_repo_key)
		end

	is_empty: BOOLEAN
			-- True if any valid repositories were found
		do
			Result := repositories.is_empty
		end

	valid_repository_path (a_path: STRING): BOOLEAN
			-- a repository index file exists in this location, but has not been added to
			-- `repositories' - i.e. `a_path' is a valid path to add to `repositories'
		do
			Result := file_system.file_exists (file_system.pathname (a_path, {ARCHETYPE_REPOSITORY_INTERFACE}.repository_file_name)) and
				not repositories.has (a_path)
		end

feature -- Iteration

	new_cursor: TABLE_ITERATION_CURSOR [ARCHETYPE_REPOSITORY_INTERFACE, STRING]
			-- Fresh cursor associated with current structure
		do
			Result := repositories.new_cursor
		end

feature -- Commands

	wipe_out
			-- remove all repositories
		do
			repositories.wipe_out
		end

	reload
			-- reload all repositories
		do
			across repositories as repos_csr loop
				repos_csr.item.reload_repository_definition
				repos_csr.item.populate_libraries
			end
		end

	extend (a_repository_path: STRING)
			-- create repository interface for repository at path `a_repository_path'
		require
			Directory_path_valid: directory_exists (a_repository_path)
		local
			arch_rep_if: ARCHETYPE_REPOSITORY_INTERFACE
		do
			create arch_rep_if.make (a_repository_path)
			repositories.force (arch_rep_if, a_repository_path)
		end

	extend_new (a_repository_path: STRING)
			-- create new repository at path `a_repository_path' and create an interface for it
		require
			Directory_path_valid: directory_exists (a_repository_path)
		local
			arch_rep_if: ARCHETYPE_REPOSITORY_INTERFACE
		do
			create arch_rep_if.make_new (a_repository_path)
			repositories.force (arch_rep_if, a_repository_path)
		end

feature {NONE} -- Implementation

	repositories: HASH_TABLE [ARCHETYPE_REPOSITORY_INTERFACE, STRING]
			-- repository interface objects, keyed by repo path

end



