note
	component:   "openEHR ADL Tools"
	description: "Visitor to generate UI visualisaiton graph from C_XX structure"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_UI_GRAPH_BUILDER

inherit
	C_VISITOR
		redefine
			start_c_boolean, start_c_integer, start_c_real, start_c_date, start_c_date_time,
			start_c_time, start_c_duration, start_c_string, start_c_terminology_code,
			end_c_archetype_root,
			end_c_complex_object,
			end_c_attribute
		end

	SHARED_ARCHETYPE_LIBRARIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (an_ed_context: ARCHETYPE_UI_GRAPH_STATE)
		do
			initialise (an_ed_context.archetype)
			create obj_node_stack.make (0)
			create attr_node_stack.make (0)
			create ui_graph_state_stack.make (0)

			-- we have a stack of contexts because the flat_ontology can vary if this is a template, i.e. contains C_ARCHETYPE_ROOTs
			ui_graph_state_stack.extend (an_ed_context)
		end

feature -- Access

	root_node: detachable C_COMPLEX_OBJECT_UI_NODE
		note
			option: stable
		attribute
		end

	ui_graph_state: ARCHETYPE_UI_GRAPH_STATE
			-- access to ed context with current archetype flat ontology
		do
			Result := ui_graph_state_stack.item
		end

feature -- Visitor

	start_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- enter n C_COMPLEX_OBJECT
		local
			ui_node: C_COMPLEX_OBJECT_UI_NODE
		do
			create ui_node.make (a_node, ui_graph_state)
			obj_node_stack.extend (ui_node)
			if a_node.is_root then
				root_node := ui_node
			else
				attr_node_stack.item.attach_child (ui_node)
			end
		end

	end_c_complex_object (a_node: C_COMPLEX_OBJECT; depth: INTEGER)
			-- exit a C_COMPLEX_OBJECT
		do
			-- deal with attribute tuples
			if attached a_node.attribute_tuples as att_tuples then
				across att_tuples as att_tuples_csr loop
					start_c_attribute_tuple (att_tuples_csr.item, depth + 1)
				end
			end

			obj_node_stack.remove
		end

	start_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- enter a C_ARCHETYPE_ROOT
		local
			ui_node: C_ARCHETYPE_ROOT_UI_NODE
			new_ui_graph_state: ARCHETYPE_UI_GRAPH_STATE
		do
			-- if we are in a template, put a new UI graph context object on the stack, because the
			-- C_ARCHETYPE_ROOT will be expanded, rather than just a reference
			if attached {OPERATIONAL_TEMPLATE} ui_graph_state.archetype as opt then
				new_ui_graph_state := ui_graph_state.twin
				new_ui_graph_state.set_flat_terminology (opt.component_terminology (a_node.archetype_ref))
				ui_graph_state_stack.extend (new_ui_graph_state)
			end
			create ui_node.make (a_node, ui_graph_state)
			obj_node_stack.extend (ui_node)

			-- if no attributes on the stack, this is node is the root node of a subtree being lazy created
			if attr_node_stack.is_empty then
				root_node := ui_node
			else
				attr_node_stack.item.attach_child (ui_node)
			end
		end

	end_c_archetype_root (a_node: C_ARCHETYPE_ROOT; depth: INTEGER)
			-- exit a C_ARCHETYPE_ROOT
		do
			obj_node_stack.remove
			if attached {OPERATIONAL_TEMPLATE} ui_graph_state.archetype then
				ui_graph_state_stack.remove
			end
		end

	start_archetype_slot (a_node: ARCHETYPE_SLOT; depth: INTEGER)
			-- enter an ARCHETYPE_SLOT
		local
			ui_node: ARCHETYPE_SLOT_UI_NODE
		do
			-- don't show closed archetype slots in flat mode
			if ui_graph_state.in_differential_view or else not a_node.is_closed then
				create ui_node.make (a_node, ui_graph_state)
				attr_node_stack.item.attach_child (ui_node)
			end
		end

	start_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- enter a C_ATTRIBUTE
		local
			ui_node: C_ATTRIBUTE_UI_NODE
		do
			-- ignore attrs whose object is a C_PRIM_OBJ and which are in c_attribute_tuples
			if not a_node.is_second_order_constrained then
				create ui_node.make (a_node, ui_graph_state)
				obj_node_stack.item.put_c_attribute (ui_node)
				attr_node_stack.extend (ui_node)
			end
		end

	end_c_attribute (a_node: C_ATTRIBUTE; depth: INTEGER)
			-- exit a C_ATTRIBUTE
		do
			if not a_node.is_second_order_constrained then
				attr_node_stack.remove
			end
		end

	start_c_attribute_tuple (a_node: C_ATTRIBUTE_TUPLE; depth: INTEGER)
			-- enter a C_ATTRIBUTE_TUPLE
		local
			ui_node: C_ATTRIBUTE_TUPLE_UI_NODE
		do
			create ui_node.make (a_node, ui_graph_state)
			obj_node_stack.item.put_c_attribute_tuple (ui_node)
		end

	start_c_leaf_object (a_node: C_LEAF_OBJECT; depth: INTEGER)
			-- enter a C_LEAF_OBJECT
		do
		end

	start_c_complex_object_proxy (a_node: C_COMPLEX_OBJECT_PROXY; depth: INTEGER)
			-- enter an ARCHETYPE_INTERNAL_REF
		local
			ui_node: C_COMPLEX_OBJECT_PROXY_UI_NODE
		do
			create ui_node.make (a_node, ui_graph_state)
			attr_node_stack.item.attach_child (ui_node)
		end

	start_c_primitive_object (a_node: C_PRIMITIVE_OBJECT; depth: INTEGER)
		do
		end

	start_c_boolean (a_node: C_BOOLEAN; depth: INTEGER)
			-- enter a C_BOOLEAN
		local
			ui_node: C_BOOLEAN_UI_NODE
		do
			-- ignore objs which are under c_attribute_tuples
			if not a_node.is_second_order_constrained then
				create ui_node.make (a_node, ui_graph_state)
				attr_node_stack.item.attach_child (ui_node)
			end
		end

	start_c_integer (a_node: C_INTEGER; depth: INTEGER)
			-- enter an C_INTEGER
		local
			ui_node: C_INTEGER_UI_NODE
		do
			-- ignore objs which are under c_attribute_tuples
			if not a_node.is_second_order_constrained then
				create ui_node.make (a_node, ui_graph_state)
				attr_node_stack.item.attach_child (ui_node)
			end
		end

	start_c_real (a_node: C_REAL; depth: INTEGER)
			-- enter a C_REAL
		local
			ui_node: C_REAL_UI_NODE
		do
			-- ignore objs which are under c_attribute_tuples
			if not a_node.is_second_order_constrained then
				create ui_node.make (a_node, ui_graph_state)
				attr_node_stack.item.attach_child (ui_node)
			end
		end

	start_c_date (a_node: C_DATE; depth: INTEGER)
			-- enter a C_DATE
		local
			ui_node: C_DATE_UI_NODE
		do
			-- ignore objs which are under c_attribute_tuples
			if not a_node.is_second_order_constrained then
				create ui_node.make (a_node, ui_graph_state)
				attr_node_stack.item.attach_child (ui_node)
			end
		end

	start_c_date_time (a_node: C_DATE_TIME; depth: INTEGER)
			-- enter a C_DATE_TIME
		local
			ui_node: C_DATE_TIME_UI_NODE
		do
			-- ignore objs which are under c_attribute_tuples
			if not a_node.is_second_order_constrained then
				create ui_node.make (a_node, ui_graph_state)
				attr_node_stack.item.attach_child (ui_node)
			end
		end

	start_c_time(a_node: C_TIME; depth: INTEGER)
			-- enter a C_TIME
		local
			ui_node: C_TIME_UI_NODE
		do
			-- ignore objs which are under c_attribute_tuples
			if not a_node.is_second_order_constrained then
				create ui_node.make (a_node, ui_graph_state)
				attr_node_stack.item.attach_child (ui_node)
			end
		end

	start_c_duration (a_node: C_DURATION; depth: INTEGER)
			-- enter a C_DURATION
		local
			ui_node: C_DURATION_UI_NODE
		do
			-- ignore objs which are under c_attribute_tuples
			if not a_node.is_second_order_constrained then
				create ui_node.make (a_node, ui_graph_state)
				attr_node_stack.item.attach_child (ui_node)
			end
		end

	start_c_string (a_node: C_STRING; depth: INTEGER)
			-- enter a C_STRING
		local
			ui_node: C_STRING_UI_NODE
		do
			-- ignore objs which are under c_attribute_tuples
			if not a_node.is_second_order_constrained then
				create ui_node.make (a_node, ui_graph_state)
				attr_node_stack.item.attach_child (ui_node)
			end
		end

	start_c_terminology_code (a_node: C_TERMINOLOGY_CODE; depth: INTEGER)
			-- enter a C_TERMINOLOGY_CODE
		local
			ui_node: C_TERMINOLOGY_CODE_UI_NODE
		do
			-- ignore objs which are under c_attribute_tuples
			if not a_node.is_second_order_constrained then
				create ui_node.make (a_node, ui_graph_state)
				attr_node_stack.item.attach_child (ui_node)
			end
		end

feature {NONE} -- Implementation

	obj_node_stack: ARRAYED_STACK [C_COMPLEX_OBJECT_UI_NODE]

	attr_node_stack: ARRAYED_STACK [C_ATTRIBUTE_UI_NODE]

	ui_graph_state_stack: ARRAYED_STACK [ARCHETYPE_UI_GRAPH_STATE]

end


