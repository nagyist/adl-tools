note
	component:   "openEHR Archetype Project"
	description: "General model of a GUI tool whose data source is an archetype"
	keywords:    "statistics, archteype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

deferred class
	GUI_ARCHETYPE_TARGETTED_TOOL

inherit
	GUI_TOOL
		rename
			populate as gui_tool_populate
		redefine
			is_populated, source
		end

feature -- Access

	source: detachable ARCH_CAT_ARCHETYPE_UI_STATE
			-- archetype descriptor to which this tool is targetted

	source_archetype: detachable ARCHETYPE
			-- differential or flat version of archetype, depending on setting of `differential_view'
		do
			if not editing_enabled then
				if differential_view then
					Result := source.differential_archetype
				else
					Result := source.flat_archetype
				end
			else
				Result := source.flat_archetype_clone
			end
		end

	source_context: detachable ARCH_ED_CONTEXT
			-- display / editor context, loaded with archetype for display, or a clone, for editing
		do
			if not editing_enabled then
				if differential_view then
					Result := source.gui_context.differential_display_context
				else
					Result := source.gui_context.flat_display_context
				end
			else
				Result := source.gui_context.editor_context
			end
		end

	tool_artefact_id: STRING
			-- a system-wide unique artefact id that can be used to find a tool in a GUI collection like
			-- docked panes or similar
		do
			Result := source.id.as_string
		end

	selected_language: STRING

feature -- Status Report

	differential_view: BOOLEAN

	is_populated: BOOLEAN
		do
			Result := precursor and attached selected_language
		end

feature -- Commands

	populate (a_source: attached like source; differential_view_flag: BOOLEAN; a_selected_language: STRING)
			-- populate the control by creating it from scratch
		require
			can_populate (a_source)
		do
			differential_view := differential_view_flag
			selected_language := a_selected_language
			gui_tool_populate (a_source)
		ensure
			is_populated
		end

	repopulate_with_language (a_selected_language: STRING)
			-- repopulate with changed language
		do
			selected_language := a_selected_language
			repopulate
		end

feature {NONE} -- Implementation

	do_populate
		deferred
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
--| The Original Code is gui_archetype_targetted_tool.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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