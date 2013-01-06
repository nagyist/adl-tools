note
	component:   "openEHR Archetype Project"
	description: "Archetype notion of a coded term"
	keywords:    "archetype, coded term"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_TERM

inherit
	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	DT_CONVERTIBLE

create
	make, make_all --, make_from_string, make_from_data_tree

feature -- Definitions

	Unknown_value: STRING = "-"

	Text_key: STRING = "text"

	Description_key: STRING = "description"

	Keys: ARRAYED_LIST [STRING]
		once
			create Result.make_from_array (<<Text_key, Description_key>>)
			Result.compare_objects
		end

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- basic make routine to guarantee validity on creation
		do
		end

	make (a_code: STRING)
		require
			Code_valid: not a_code.is_empty
		do
			code := a_code
		ensure
			code_set: code.same_string (a_code)
			text_set: text.same_string (Unknown_value)
			description_set: description.same_string (Unknown_value)
		end

	make_all (a_code, a_text, a_description: STRING)
		require
			Code_valid: not a_code.is_empty
			Text_valid: not a_text.is_empty
			Description_valid: not a_description.is_empty
		do
			code := a_code
			text := a_text
			description := a_description
		ensure
			code_set: code.same_string (a_code)
			text_set: text.same_string (a_text)
			description_set: description.same_string (a_description)
		end

feature -- Access

	code: STRING
        attribute
            create Result.make_from_string (Default_concept_code)
        end

	text: STRING
        attribute
            create Result.make_from_string (Unknown_value)
        end

	description: STRING
        attribute
            create Result.make_from_string (Unknown_value)
        end

--	provenance: attached STRING

	item (a_key: STRING): detachable STRING
		require
			has_key (a_key)
		do
			if a_key.same_string (Text_key) then
				Result := text
			elseif a_key.same_string (Description_key) then
				Result := description
--			elseif a_key.same_string ("provenance") then
--				Result := provenance
			else
				check False end
			end
		end

feature -- Status Report

	has_key (a_key: STRING): BOOLEAN
		do
			Result := keys.has (a_key)
		end

feature -- Modification

	set_value (a_val, a_key: STRING)
			-- set value `a_val' into property for `a_key'
		require
			has_key (a_key)
		do
			if a_key.same_string (Text_key) then
				text := a_val
			elseif a_key.same_string (Description_key) then
				description := a_val
			end
		end

	set_code (a_code: STRING)
		require
			Code_valid: not a_code.is_empty
		do
			code := a_code
		ensure
			code_set: code.same_string (a_code)
		end

	set_text (a_text: STRING)
		require
			Text_valid: not a_text.is_empty
		do
			text := a_text
		ensure
			text_set: text.same_string (a_text)
		end

	set_description (a_description: STRING)
		require
			Description_valid: not a_description.is_empty
		do
			description := a_description
		ensure
			description_set: description.same_string (a_description)
		end

feature -- Factory

	create_translated_term (a_lang: STRING): ARCHETYPE_TERM
			-- create a new ARCHETYPE_TERM whose members are the same as those in the current object,
			-- with '*' prepended and '(lang)' appended - this acts as an obvious
			-- placeholder for translation. The lang is the original lang of a_term.
		require
			Lang_valid: not a_lang.is_empty
		do
			create Result.make (code)
			Result.set_text ("*" + text + "(" + a_lang + ")")
			Result.set_description ("*" + description + "(" + a_lang + ")")
		ensure
			same_code: Result.code.same_string (code)
			translated_text: Result.text.has_substring (text) and not Result.text.is_equal (text)
			translated_description: Result.description.has_substring (description) and not Result.description.is_equal (description)
		end

	create_derived_term (a_code: STRING): ARCHETYPE_TERM
			-- create a new ARCHETYPE_TERM whose members are the same as those in the current object,
			-- with an '!' prepended and appended to each term to indicate that it needs to be edited.
			-- The new term has the code `a_code'.
		require
			Code_valid: not a_code.is_empty
		do
			create Result.make (code)
			Result.set_text ("!" + text + "!")
			Result.set_description ("!" + description + "!")
		ensure
			same_code: Result.code.same_string (code)
			derived_text: Result.text.has_substring (text) and not Result.text.is_equal (text)
			derived_description: Result.description.has_substring (description) and not Result.description.is_equal (description)
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend ("text")
			Result.extend ("description")
		end

invariant
	Code_valid: not code.is_empty

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
--| The Original Code is adl_term.e.
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
