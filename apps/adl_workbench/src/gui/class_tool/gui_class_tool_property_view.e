note
	component:   "openEHR ADL Tools"
	description: "Class control - visualise property view of a class, including inheritance lineage."
	keywords:    "archetype, gui, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_CLASS_TOOL_PROPERTY_VIEW

inherit
	GUI_CLASS_TARGETTED_TOOL

	SHARED_BMM_MODEL_ACCESS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Grid_declared_in_col: INTEGER = 1
	Grid_property_col: INTEGER = 2
	Grid_property_type_col: INTEGER = 3

	Grid_column_ids: ARRAY [INTEGER]
		once
			Result := <<Grid_declared_in_col, Grid_property_col, Grid_property_type_col>>
		end

	Grid_enum_name_col: INTEGER = 1
	Grid_enum_value_col: INTEGER = 2
	Grid_enum_dummy_col: INTEGER = 3

feature -- Initialisation

	make
		do
			create anc_classes.make(0)
			create flat_properties.make (0)

			-- create widgets
			create ev_root_container

			create ev_grid
			ev_grid.enable_tree

			-- connect widgets
			ev_root_container.extend (ev_grid)
			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

feature {NONE} -- Implementation

	do_clear
		do
 			ev_grid.wipe_out
		end

	do_populate
		do
			flat_properties := safe_source.flat_properties
			create anc_classes.make(0)

			if attached {BMM_ENUMERATION} source then
				do_populate_enumeration
			else
				do_populate_properties
			end

			-- resize grid cols properly
			Grid_column_ids.do_all (
				agent (i: INTEGER; a_grid: EV_GRID)
					do
						a_grid.column (i).resize_to_content
						a_grid.column(i).set_width ((a_grid.column (i).width * 1.1).ceiling)
					end (?, ev_grid)
			)
		end

	do_populate_properties
			-- populate properties of normal class
		do
			-- grid columns
			ev_grid.insert_new_column (Grid_declared_in_col)
			ev_grid.column (Grid_declared_in_col).set_title (get_text (ec_property_grid_declared_in_col_title))

			ev_grid.insert_new_column (Grid_property_col)
			ev_grid.column (Grid_property_col).set_title (get_text (ec_property_grid_property_col_title))

			ev_grid.insert_new_column (Grid_property_type_col)
			ev_grid.column (Grid_property_type_col).set_title (get_text (ec_property_grid_property_type_col_title))

			-- add the rows
			check attached source as src then
 				populate_class_node (src)
 			end
		end

	do_populate_enumeration
			-- populate enumeration class
   		local
			gli: EV_GRID_LABEL_ITEM
		do
			-- grid columns
			ev_grid.insert_new_column (Grid_enum_name_col)
			ev_grid.column (Grid_enum_name_col).set_title (get_text (ec_enumeration_grid_enum_name_col_title))

			ev_grid.insert_new_column (Grid_enum_value_col)
			ev_grid.column (Grid_enum_value_col).set_title (get_text (ec_enumeration_grid_enum_value_col_title))

			ev_grid.insert_new_column (Grid_enum_dummy_col)

			-- add the rows
			check attached {BMM_ENUMERATION} source as enum_src then
				across enum_src.item_names as names_csr loop
					create gli.make_with_text (names_csr.item)
					-- gli.set_pixmap (get_icon_pixmap ("rm/generic/" + a_class_def.type_category))
					ev_grid.set_item (Grid_enum_name_col, ev_grid.row_count + 1, gli)

					create gli.make_with_text (enum_src.item_values.i_th (names_csr.target_index).value_literal)
					ev_grid.set_item (Grid_enum_value_col, ev_grid.row_count, gli)
				end
 			end
		end

	flat_properties: STRING_TABLE [BMM_PROPERTY]

	anc_classes: ARRAYED_LIST [BMM_CLASS]

	ev_grid: EV_GRID_KBD_MOUSE

   	populate_class_node (a_class_def: BMM_CLASS)
			-- Add rows and sub rows if there are properties from `a_class_def' found in the flat_properties
			-- of `source'. Then iterate through ancestors recusrively
   		local
			gli: EV_GRID_LABEL_ITEM
			class_row, property_row: EV_GRID_ROW
			prop_list: ARRAYED_LIST [BMM_PROPERTY]
			prop_type: BMM_TYPE
			prop_type_text, prop_text: STRING
		do
			-- find properties defined on `a_class_def', if any; have to check against flat properties, since
			-- there could be properties which were overridden in some lower descendant, and which
			-- therefore should not be displayed as being from the original class
			create prop_list.make (0)
			across a_class_def.properties as properties_csr loop
				if flat_properties.has_item (properties_csr.item) then
					prop_list.extend (properties_csr.item)
				end
			end

			-- if there were any, populate the class and then the properties
			if not prop_list.is_empty then

				-- populate class row in 'Declared in' column
				create gli.make_with_text (a_class_def.type.type_signature)
				gli.set_pixmap (get_icon_pixmap ("rm/generic/" + a_class_def.entity_category))
				if attached a_class_def.documentation as bmm_class_doc then
					gli.set_tooltip (get_text (ec_bmm_documentation_text) + "%N%T" + bmm_class_doc)
				end
				gli.set_data (a_class_def)
				gli.pointer_button_press_actions.force_extend (agent class_node_handler (gli, ?, ?, ?))
				ev_grid.set_item (Grid_declared_in_col, ev_grid.row_count + 1, gli)
				class_row := gli.row

				-- do property rows if we have not already encountered this class due to
				-- multiple inheritance
				if not anc_classes.has (a_class_def) then
					across prop_list as props_csr loop
						-- property name
						create prop_text.make_from_string (props_csr.item.name)
						if props_csr.item.is_synthesised_generic then
							prop_text.append (" *")
						end
						create gli.make_with_text (prop_text)
						if props_csr.item.is_im_infrastructure then
							gli.set_foreground_color (rm_infrastructure_attribute_colour)
						elseif props_csr.item.is_im_runtime then
							gli.set_foreground_color (rm_runtime_attribute_colour)
						else
							gli.set_foreground_color (rm_attribute_color)
						end

						-- pixmap
						gli.set_pixmap (get_icon_pixmap (Icon_rm_generic_dir + resource_path_separator + props_csr.item.multiplicity_key_string))

						-- tooltip
						create prop_text.make_empty
						if props_csr.item.is_synthesised_generic then
							prop_text.append (get_text (ec_bmm_prop_synth_gen_text) + "%N")
						end
						if attached props_csr.item.documentation as bmm_prop_doc then
							prop_text.append (get_text (ec_bmm_documentation_text) + "%N%T" + bmm_prop_doc)
						end
						if not prop_text.is_empty then
							gli.set_tooltip (prop_text)
						end

						ev_grid.set_item (Grid_property_col, ev_grid.row_count + 1, gli)
						property_row := gli.row

						-- property type
						prop_type := props_csr.item.bmm_type
						prop_type_text := prop_type.type_signature
						if attached {BMM_MODEL_TYPE} prop_type as bmm_ent_type and then attached bmm_ent_type.value_constraint as vs_constraint then
							prop_type_text.append (" " + vs_constraint.as_delimited_string)
						elseif attached {BMM_CONTAINER_TYPE} prop_type as bmm_cont_type and then attached {BMM_MODEL_TYPE} bmm_cont_type.base_type as bmm_ent_type
							and then attached bmm_ent_type.value_constraint as vs_constraint
						then
							prop_type_text.append (" " + vs_constraint.as_delimited_string)
						end
						create gli.make_with_text (prop_type_text)
						gli.set_pixmap (get_icon_pixmap (Icon_rm_generic_dir + resource_path_separator + prop_type.entity_category))
						gli.set_data (prop_type)

						-- tooltip
						if attached {BMM_MODEL_TYPE} prop_type.effective_type as bmm_model_type and then
							attached bmm_model_type.defining_class.documentation as bmm_prop_class_doc
						then
							gli.set_tooltip (get_text (ec_bmm_documentation_text) + "%N%T" + bmm_prop_class_doc)
						end

						-- add actions
						gli.pointer_button_press_actions.force_extend (agent class_node_handler (gli, ?, ?, ?))
						property_row.set_item (Grid_property_type_col, gli)
					end
				end
				anc_classes.extend (a_class_def)
			end

			-- visit ancestors, recursively
			if not differential_view then
				across a_class_def.ancestors as ancs_csr loop
					populate_class_node (ancs_csr.item.defining_class)
				end
			end
		end

	class_node_handler (eti: EV_SELECTABLE; x,y, button: INTEGER)
			-- creates the context menu for a right click action for class node
		local
			menu: EV_MENU
		do
			if button = {EV_POINTER_CONSTANTS}.right and attached {BMM_MODEL_TYPE} eti.data as bmm_type then
				create menu
				-- add menu item for retarget tool to current node / display in new tool
				add_class_context_menu (menu, bmm_type.defining_class)
				menu.show
			end
		end

end


