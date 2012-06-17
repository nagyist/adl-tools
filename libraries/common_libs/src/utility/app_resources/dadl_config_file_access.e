note
	component:   "openEHR Libraries"
	description: "[
				 Access to a configuration file in dALD format. Programmatic access uses paths to refer to 
				 any specific item.
				 ]"
	keywords:    "config, file"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010 openEHR Foundation <http://www.openEHR.org>"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class DADL_CONFIG_FILE_ACCESS

inherit
	SHARED_DT_OBJECT_CONVERTER
		export
			{NONE} all
		undefine
			is_equal, out, default_create
		end

	SHARED_RESOURCES

	SHARED_MESSAGE_DB

create
	make

feature -- Definitions

	file_header_text: STRING
		once
			create Result.make(0)
			Result.append("--%N")
			Result.append("-- " + get_msg_line ("config_settings_line1", <<application_name>>))
			Result.append("-- " + get_msg_line ("config_settings_line2", Void))
			Result.append("--%N")
			Result.append("%N")
		end

feature -- Initialisation

	make (a_file_path: attached STRING)
		do
			create refresh_listeners.make (0)
			create requested_resources.make (0)
			file_path := a_file_path
			load
		end

feature -- Access

	file_path: STRING
			-- path to resource file

	requested_resources: attached ARRAYED_SET [STRING]
			-- paths that the application has requsted so far

	integer_value (a_path: attached STRING): INTEGER
			-- get the integer value for resource at `a_path'
		do
			if has_resource (a_path) then
				Result ?= dt_tree.value_at_path (a_path)
			end
			requested_resources.extend (a_path)
		end

	boolean_value (a_path: attached STRING): BOOLEAN
			-- get the boolean value for resource at `a_path'
		do
			if has_resource (a_path) then
				Result ?= dt_tree.value_at_path (a_path)
			end
			requested_resources.extend (a_path)
		end

	string_value (a_path: attached STRING): attached STRING
			-- get the string value for resource at `a_path'; return empty string if nothing found
		do
			if has_resource (a_path) then
				Result ?= dt_tree.value_at_path (a_path)
			else
				create Result.make (0)
			end
			requested_resources.extend (a_path)
		end

	list_any_value (a_path: attached STRING): SEQUENCE [ANY]
			-- List of items specified in file at `a_path'.
		do
			if has_resource (a_path) then
				Result := dt_tree.value_list_at_path (a_path)
			end
			requested_resources.extend (a_path)
		end

	string_list_value (a_path: attached STRING): attached ARRAYED_LIST [STRING]
			-- List of items specified in file at `a_path'.
		do
			if has_resource(a_path) then
				Result ?= dt_tree.value_list_at_path (a_path)
			else
				create Result.make (0)
			end
			requested_resources.extend (a_path)
		end

	string_value_env_var_sub (a_path: attached STRING): attached STRING
			-- get the string value for `a_path', with any env vars of form "$var" substituted
		do
			if has_resource(a_path) then
				Result ?= dt_tree.value_at_path (a_path)
				Result := substitute_env_vars(Result)
			else
				create Result.make (0)
			end
			requested_resources.extend (a_path)
		end

	any_value (a_path: attached STRING): ANY
			-- get the value for resource_name
		do
			if has_resource(a_path) then
				Result := dt_tree.value_at_path (a_path)
			end
			requested_resources.extend (a_path)
		end

	object_value (a_path: attached STRING; a_type_name: attached STRING): ANY
			-- get complex object at `a_path'
		do
			if has_resource(a_path) then
				if attached {DT_COMPLEX_OBJECT_NODE} dt_tree.node_at_path (a_path) as dt_obj then
					Result := dt_obj.as_object_from_string (a_type_name, Void)
				end
			end
			requested_resources.extend (a_path)
		end

feature -- Status Report

	has_resource (a_path: attached STRING): BOOLEAN
			-- True if there is a resource at `a_path'
		do
			Result := attached dt_tree and then dt_tree.has_path (a_path)
		end

feature -- Modification

	put_value (a_path: attached STRING; a_value: attached ANY)
			-- put an instance of any dADL leaf value type
		do
			if not attached dt_tree then
				create_default_dt_tree
			end
			if has_resource(a_path) then
				dt_tree.set_value_at_path (a_value, a_path)
			else
				dt_tree.put_value_at_path (a_value, a_path)
			end
		end

	put_object (a_path: attached STRING; a_value: attached ANY)
			-- convert a complex object to Data Tree form and put at `a_path' in current tree
			-- FIXME: currently only works for single child paths, i.e. not where the paths ends with xxx[zzz]
		local
			obj_dt_tree: DT_COMPLEX_OBJECT_NODE
			dt_attr: DT_ATTRIBUTE_NODE
		do
			if not attached dt_tree then
				create_default_dt_tree
			end
			obj_dt_tree := object_converter.object_to_dt(a_value)
			if has_resource(a_path) then
				dt_attr := dt_tree.attribute_node_at_path (a_path)
				dt_attr.remove_all_children
				dt_attr.put_child (obj_dt_tree)
			else
				dt_tree.put_object_at_path (obj_dt_tree, a_path)
			end
		end

	add_refresh_listener (an_agent: PROCEDURE [ANY, TUPLE])
			-- adda listener to be executed on file reload
		do

		end

feature -- Element Removal

	remove_resource (a_path: attached STRING)
			-- remove the resource resource_name
		require
            Valid_path: has_resource(a_path)
        local
        	dt_obj: DT_OBJECT_ITEM
		do
			dt_obj := dt_tree.node_at_path (a_path)
			if not dt_obj.is_root then
				dt_obj.parent.remove_child (dt_obj)
			end
		ensure
			Path_removed: not has_resource(a_path)
		end

feature -- Commands

	load
		do
			if file_system.file_exists (file_path) then
				read
				if not attached dt_tree then
					create_default_dt_tree
				end
			end
		end

	save
		local
			a_dt_iterator: DT_VISITOR_ITERATOR
			res_file: PLAIN_TEXT_FILE
			dir: STRING
		do
			-- serialise to a String
			dt_serialiser.reset
			create a_dt_iterator.make (dt_tree, dt_serialiser)
			a_dt_iterator.do_all

			-- write to the config file
			create res_file.make (file_path)
			if not file_system.file_exists (file_path) then
				dir := file_system.dirname (file_path)
				if not file_system.directory_exists (dir) then
					file_system.recursive_create_directory (dir)
				end
				res_file.create_read_write
			else
				res_file.open_write
			end
			res_file.put_string (file_header_text)
			res_file.put_string (dt_serialiser.last_result)
			res_file.close
		end

feature {NONE} -- Implementation

	read
			-- read content from file and parse to Data Tree form.
			-- if file not readable, or not there, or in wrong syntax, do nothing.
		local
			res_file: PLAIN_TEXT_FILE
			parser: DADL_VALIDATOR
		do
			create res_file.make (file_path)
			if res_file.exists and res_file.is_readable then
				res_file.open_read
				res_file.read_stream (res_file.count)
				create parser.make
				parser.execute (res_file.last_string, 1)
				if not parser.syntax_error then
					dt_tree := parser.output
				end
				res_file.close
			end

			-- update any refresh listeners
			from refresh_listeners.start until refresh_listeners.off loop
				 refresh_listeners.item.call ([])
				 refresh_listeners.forth
			end
		end

	env_var_pattern_matcher: LX_DFA_REGULAR_EXPRESSION
			-- pattern for detecting $NAME in config values
		once
			create Result.compile (env_var_pattern, True)
		end

	env_var_pattern: STRING = "\$[a-zA-Z0-9_]+"

	dt_tree: DT_COMPLEX_OBJECT_NODE

	dt_serialiser: attached DT_DADL_SERIALISER
		once
			create Result.make(create {NATIVE_DADL_SERIALISATION_PROFILE}.make("dadl"))
		end

	create_default_dt_tree
		do
			create dt_tree.make_anonymous
		end

	refresh_listeners: ARRAYED_LIST [PROCEDURE [ANY, TUPLE]]
			-- listeners to execute on file refresh

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
--| The Original Code is config_file_access.e.
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
