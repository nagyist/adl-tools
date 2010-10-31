note
	component:   "openEHR Archetype Project"
	description: "[
				 A thumbnail version of an archetype, suitable for building from a simple parser like ARCHETYPE_MINI_PARSER,
				 designed to extract key data from the header of the archetype, sufficient to allow building of the archetpe
				 directory, and setting of flags in the GUI.
				 ]"
	keywords:    "archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_THUMBNAIL

inherit
	ARCHETYPE_DEFINITIONS
		export
			{NONE} all;
			{ANY} valid_adl_version
		end

feature -- Access

	archetype_id: ARCHETYPE_ID

	adl_version: STRING
			-- ADL version of this archetype

	artefact_type: INTEGER
			-- design type of artefact, archetype, template, template-component, etc

	parent_archetype_id: ARCHETYPE_ID
			-- id of specialisation parent of this archetype

feature -- Status Report

	is_generated: BOOLEAN
			-- True if this archetype was generated from another one, rather than being an original authored archetype

	is_differential: BOOLEAN
			-- archetype is source form archetype

	is_template: BOOLEAN
			-- True if `artefact_type' is any type other than archetype
		do
			Result := artefact_type = (create {ARTEFACT_TYPE}).template
		end

	is_specialised: BOOLEAN
			-- True if a 'specialise' statement with a parent archetype id was found
		do
			Result := parent_archetype_id /= Void
		end

	archetype_id_is_old_style: BOOLEAN
			-- True if the id has an old-style non-conformant form, e.g. with 'draft' in the version id part

	parent_archetype_id_is_old_style: BOOLEAN
			-- True if the parent_id has an old-style non-conformant form, e.g. with 'draft' in the version id part

	differential_generated: BOOLEAN
			-- True if the differential form was generated
		do
			Result := is_differential and is_generated
		end

feature -- Status Setting

	set_is_differential
			-- set is_differential flag
		do
			is_differential := True
		end

	set_is_generated
			-- set is_generated flag
		do
			is_generated := True
		end

	set_archetype_id_is_old_style
			-- set `archetype_id_is_old_style' flag
		do
			archetype_id_is_old_style := True
		end

	set_parent_archetype_id_is_old_style
			-- set `parent_archetype_id_is_old_style' flag
		do
			parent_archetype_id_is_old_style := True
		end

feature -- Modification

	set_artefact_type (s: STRING)
		require
			s /= Void and then (create {ARTEFACT_TYPE}).valid_type_name(s)
		do
			artefact_type := (create {ARTEFACT_TYPE}).type_name_to_type (s)
		end

	set_adl_version(a_ver: STRING)
			-- set adl_version with a string containing only '.' and numbers,
			-- not commencing or finishing in '.'
		require
			Valid_version: a_ver /= Void and then valid_adl_version(a_ver)
		do
			adl_version := a_ver
		end

	set_archetype_id (an_id: attached STRING)
		do
			create archetype_id.make_from_string (an_id)
		end

	set_parent_archetype_id (an_id: attached STRING)
		do
			create parent_archetype_id.make_from_string (an_id)
		end


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
--| The Original Code is archetype_thumbnail.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2010
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