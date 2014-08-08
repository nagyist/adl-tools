note
	component:   "openEHR ADL Tools"
	description: "[
				 Interface to a physical archetype repository, which is a contiguous hierarchical 
				 structure (file system or similar) in which one of more archetype libraries may 
				 exist. Each archetype library corresponds to one logical archetype collection, 
				 thus a 'repository' corresponds to a physical repository (e.g. Git repo) containing
				 one or more of these.
				 ]"
	keywords:    "ADL, archetype, aom, profile"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_REPOSITORY_DEFINITION

inherit
	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

create
	make_dt

feature -- Definitions

	Default_archetype_repository_name: STRING = "Unknown"

	Default_archetype_repository_maintainer: STRING = "Unknown"

	Key_separator: STRING = "-"

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- make in a safe way for DT building purposes
		do
		end

feature -- Access (attributes from file)

	name: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make_from_string (Default_archetype_repository_name)
		end

	description: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make_empty
		end

	maintainer: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make_from_string (Default_archetype_repository_maintainer)
		end

	key: STRING
			-- made from "maintainer:name"
		do
			create Result.make_empty
			Result.append (maintainer)
			Result.append (Key_separator)
			Result.append (name)
		end

feature {DT_OBJECT_CONVERTER} -- Persistence

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

	finalise_dt
			-- Finalisation work: evaluate rm schema regexes
		do
		end

end


