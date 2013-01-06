note
	component:   "openEHR Archetype Project"
	description: "interface class to ADL parser and parse tree"
	keywords:    "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"
	void_safety: "initial"

class CADL_ENGINE

inherit
	PARSER_ENGINE
		rename
			set_source as parser_set_source
		redefine
			tree, parser, assign_parser_result
		end

	SHARED_C_SERIALISERS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, has_c_serialiser_format
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			create parser.make
		end

feature -- Access

	tree: detachable C_COMPLEX_OBJECT
			-- Set if parse succeeded.

feature -- Status Report

	is_differential: BOOLEAN
			-- True if archetype is differential

feature -- Commands

	set_source (in_text: STRING; a_source_start_line: INTEGER; differential_flag: BOOLEAN; an_rm_schema: BMM_SCHEMA)
			-- Set `in_text' as working artifact.
		do
			parser_set_source (in_text, a_source_start_line)
			rm_schema := an_rm_schema
			is_differential := differential_flag
		ensure then
			is_differential_set: is_differential = differential_flag
		end

	serialise (an_archetype: ARCHETYPE; a_format, a_lang: STRING)
			-- Serialise current artifact into `a_format'.
		require
			Format_valid: has_c_serialiser_format (a_format)
			Language_valid: an_archetype.has_language (a_lang)
		local
			a_c_iterator: OG_CONTENT_ITERATOR
		do
			if attached tree as att_tree and attached c_serialiser_for_format (an_archetype, a_lang, a_format) as a_c_serialiser then
				a_c_serialiser.initialise (an_archetype, a_lang)
				create a_c_iterator.make (att_tree.representation, a_c_serialiser)
				a_c_iterator.do_all
				a_c_serialiser.finalise
				serialised := a_c_serialiser.last_result
			end
		ensure
			serialised_attached: attached serialised
		end

feature {NONE} -- Implementation

	assign_parser_result
			-- override in descendants to get around limitations in gobo parsers not being able
			-- to be componentised
		do
			if attached {C_COMPLEX_OBJECT} parser.output as cco then
				tree := cco
			end
		end

	parser_execute
			-- call the parser.execute with specific args
		do
			if attached source as att_source and attached rm_schema as rms then
				parser.execute (att_source, source_start_line, is_differential, rms)
			end
		end

	parser: CADL_VALIDATOR

	rm_schema: detachable BMM_SCHEMA

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
--| The Original Code is cadl_engine.e.
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
