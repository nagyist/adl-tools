note
	component:   "openEHR Archetype Project"
	description: "[
				 Language-specific detail of resource description. When a resource 
				 is translated for use in another language environment, each 
				 RESOURCE_DESCRIPTION_ITEM needs to be copied and translated into 
				 the new language.
				 ]"
	keywords:    "archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class RESOURCE_DESCRIPTION_ITEM

inherit
	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	DT_CONVERTIBLE
		export
			{NONE} all
		end

create
	make_dt, make, make_from_language

feature -- Definitions

	Default_purpose: STRING = "???"

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			--
		do
			language := Default_language_code
			create purpose.make (0)
			purpose.append (Default_purpose)
		end

	make (a_lang: CODE_PHRASE; a_purpose: STRING)
		require
			Purpose_valid: not a_purpose.is_empty
		do
			language := a_lang
			purpose := a_purpose
		ensure
			Language_set: language = a_lang
			Purpose_set: purpose = a_purpose
		end

	make_from_language (a_lang_name: STRING)
			-- make using a_lang_name and default language code ste
		require
			Lang_valid: not a_lang_name.is_empty
		do
			create language.make (default_language_code_set, a_lang_name)
			purpose := Default_purpose.twin
		ensure
			Language_set: language.code_string.is_equal (a_lang_name)
			Purpose_set: purpose.is_equal (Default_purpose)
		end

feature -- Access

	language: CODE_PHRASE
			-- Language of this item

	purpose: STRING
			-- Purpose of the archetype.

	use: detachable STRING
			-- Description of the uses of the archetype,
			-- i.e. contexts in which it could be used.

	keywords:  detachable ARRAYED_LIST [STRING]
			-- Keywords which characterise this archetype, used e.g.
			-- for indexing and searching.

	misuse:  detachable STRING
			-- Description of any misuses of the archetype,
			-- i.e. contexts in which it should not be used.

	copyright:  detachable STRING
			-- Rights over the archetype as a knowledge resource;
			-- usually copyright and/or license to use.

	original_resource_uri: detachable HASH_TABLE [STRING, STRING]
			-- URI of precursor resource of archetype, e.g. natural language
			-- document, semi-formal description

	other_details:  detachable HASH_TABLE [STRING, STRING]
			-- Additional language-senstive archetype meta-data, as a list of name/value pairs.

feature -- Status Report

	has_keyword (a_keyword: STRING): BOOLEAN
		do
			Result := attached keywords and then keywords.has (a_keyword)
		end

feature -- Modification

	set_purpose (a_purpose: STRING)
			-- set purpose
		require
			Purpose_valid: not a_purpose.is_empty
		do
			purpose := a_purpose
		ensure
			Purpose_set: purpose = a_purpose
		end

	set_use (a_use: STRING)
			-- set use
		require
			Purpose_valid: not a_use.is_empty
		do
			use := a_use
		ensure
			Use_set: use = a_use
		end

	clear_use
			-- remove `use'
		do
			use := Void
		ensure
			not attached use
		end

	set_misuse (a_misuse: STRING)
			-- set misuse
		require
			Misuse_valid: not a_misuse.is_empty
		do
			misuse := a_misuse
		ensure
			Misuse_set: misuse = a_misuse
		end

	clear_misuse
			-- remove `misuse'
		do
			misuse := Void
		ensure
			not attached misuse
		end

	set_copyright (a_copyright: STRING)
			-- set copyright
		require
			Copyright_valid: not a_copyright.is_empty
		do
			copyright := a_copyright
		ensure
			Copyright_set: copyright = a_copyright
		end

	clear_copyright
			-- remove copyright
		do
			copyright := Void
		ensure
			not attached copyright
		end

	add_keyword (a_keyword: STRING; i: INTEGER)
			-- add a_keyword to `keywords' at position `i', or end if i is 0
		require
			Keyword_valid: not has_keyword (a_keyword)
			Valid_max_index: attached keywords implies i <= keywords.count
		do
			if not attached keywords then
				create keywords.make(0)
				keywords.compare_objects
			end
			if i > 0 then
				keywords.go_i_th (i)
				keywords.put_left (a_keyword)
			else
				keywords.extend (a_keyword)
			end
		ensure
			Keyword_added: keywords.has (a_keyword)
			Insert_position: i > 0 implies keywords.i_th (i) = a_keyword
		end

	remove_keyword (a_keyword: STRING)
			-- remove a_keyword from `keywords'
		require
			Contributor_valid: has_keyword (a_keyword)
		do
			keywords.prune (a_keyword)
		ensure
			Keyword_removed: not has_keyword (a_keyword)
		end

	put_other_details_item (a_key, a_value: STRING)
			-- put the key, value pair to other_details
		require
			Key_valid: not a_key.is_empty
			Value_valid: not a_value.is_empty
		do
			if other_details = Void then
				create other_details.make(0)
			end
			other_details.force (a_value, a_key)
		ensure
			Other_details_set: other_details.item(a_key) = a_value
		end

	remove_other_details_item (a_key: STRING)
			-- remove item with key `a_key' from other_details
		require
			Key_valid: other_details.has (a_key)
		do
			other_details.remove (a_key)
			if other_details.is_empty then
				other_details := Void
			end
		ensure
			old other_details.count = 1 implies other_details = Void
		end

	put_original_resource_uri_item (a_key, a_value: STRING)
			-- add the key, value pair to original_resource_uri
		require
			Key_valid: not a_key.is_empty
			Value_valid: not a_value.is_empty
		do
			if original_resource_uri = Void then
				create original_resource_uri.make (0)
			end
			-- original_resource_uri.put(create {URI}.make_from_string(a_value), a_key)
			original_resource_uri.put (a_value, a_key)
		ensure
			Original_resource_uri_added: original_resource_uri.item (a_key) = a_value
		end

	remove_original_resource_uri_item (a_key: STRING)
			-- remove item with key `a_key' from `original_resource_uri'
		require
			Key_valid: original_resource_uri.has (a_key)
		do
			original_resource_uri.remove (a_key)
			if other_details.is_empty then
				original_resource_uri := Void
			end
		ensure
			old original_resource_uri.count = 1 implies original_resource_uri = Void
		end

feature -- Copying

	translated_copy (a_lang: STRING): RESOURCE_DESCRIPTION_ITEM
			-- generate a copy of this object, with all strings sss replaced by
			-- "*sss(orig_lang)"
		require
			not language.code_string.is_equal(a_lang)
		local
			prefix_str, suffix_str: STRING
		do
			prefix_str := "*"
			suffix_str := "(" + a_lang + ")"
			create Result.make(create {CODE_PHRASE}.make(Default_language_code_set, a_lang), prefix_str + purpose + suffix_str)
			if attached use then
				Result.set_use(prefix_str + use + suffix_str)
			end
			if attached misuse then
				Result.set_misuse(prefix_str + misuse + suffix_str)
			end
			if attached copyright then
				Result.set_copyright(prefix_str + copyright + suffix_str)
			end
			if attached keywords then
				from keywords.start until keywords.off loop
					Result.add_keyword (prefix_str + keywords.item + suffix_str, 0)
					keywords.forth
				end
			end
			if attached original_resource_uri then
				from original_resource_uri.start until original_resource_uri.off loop
					Result.put_original_resource_uri_item (prefix_str + original_resource_uri.key_for_iteration + suffix_str,
						original_resource_uri.item_for_iteration)
					original_resource_uri.forth
				end
			end
			if attached other_details then
				from other_details.start until other_details.off loop
					Result.put_other_details_item (prefix_str + other_details.key_for_iteration + suffix_str,
						prefix_str + other_details.item_for_iteration + suffix_str)
					other_details.forth
				end
			end
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend("language")
			Result.extend("purpose")
			Result.extend("use")
			Result.extend("misuse")
			Result.extend("keywords")
			Result.extend("original_resource_uri")
			Result.extend("copyright")
			Result.extend("other_details")
		end

invariant
	language_valid: code_set(code_set_id_languages).has(language)
	purpose_valid: not purpose.is_empty
	use_valid: use /= Void implies not use.is_empty
	misuse_valid: misuse /= Void implies not misuse.is_empty
	copyright_valid: copyright /= Void implies not copyright.is_empty

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
--| The Original Code is archetype_description.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|	Sam Heard
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
