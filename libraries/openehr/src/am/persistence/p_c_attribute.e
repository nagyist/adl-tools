note
	component:   "openEHR ADL Tools"
	description: "node in ADL parse tree"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_ATTRIBUTE

inherit
	P_ARCHETYPE_CONSTRAINT

create
	make

feature -- Initialisation

	make (a_ca: C_ATTRIBUTE)
			-- make from C_ATTRIBUTE
		do
			rm_attribute_name := a_ca.rm_attribute_name
			differential_path := a_ca.differential_path
			is_multiple := a_ca.is_multiple
			if attached a_ca.existence then
				existence := a_ca.existence.as_string
			end
			if attached a_ca.cardinality then
				cardinality := a_ca.cardinality.as_string
			end
			if a_ca.has_children then
				create children.make (0)
				across a_ca.children as c_objs_csr loop
					if attached {C_ARCHETYPE_ROOT} c_objs_csr.item as c_ar then
						children.extend (create {P_C_ARCHETYPE_ROOT}.make(c_ar))
					elseif attached {C_COMPLEX_OBJECT} c_objs_csr.item as c_co then
						children.extend (create {P_C_COMPLEX_OBJECT}.make(c_co))
					elseif attached {ARCHETYPE_SLOT} c_objs_csr.item as a_s then
						children.extend (create {P_ARCHETYPE_SLOT}.make(a_s))
					elseif attached {C_COMPLEX_OBJECT_PROXY} c_objs_csr.item as a_ir then
						children.extend (create {P_C_COMPLEX_OBJECT_PROXY}.make(a_ir))
					elseif attached {C_INTEGER} c_objs_csr.item as c_po then
						children.extend (create {P_C_INTEGER}.make(c_po))
					elseif attached {C_REAL} c_objs_csr.item as c_po then
						children.extend (create {P_C_REAL}.make(c_po))
					elseif attached {C_DATE} c_objs_csr.item as c_po then
						children.extend (create {P_C_DATE}.make(c_po))
					elseif attached {C_TIME} c_objs_csr.item as c_po then
						children.extend (create {P_C_TIME}.make(c_po))
					elseif attached {C_DATE_TIME} c_objs_csr.item as c_po then
						children.extend (create {P_C_DATE_TIME}.make(c_po))
					elseif attached {C_DURATION} c_objs_csr.item as c_po then
						children.extend (create {P_C_DURATION}.make(c_po))
					elseif attached {C_BOOLEAN} c_objs_csr.item as c_po then
						children.extend (create {P_C_BOOLEAN}.make(c_po))
					elseif attached {C_TERMINOLOGY_CODE} c_objs_csr.item as c_po then
						children.extend (create {P_C_TERMINOLOGY_CODE}.make(c_po))
					elseif attached {C_STRING} c_objs_csr.item as c_po then
						children.extend (create {P_C_STRING}.make(c_po))
					end
				end
			end
		end

feature -- Access

	rm_attribute_name: STRING

	differential_path: detachable STRING

	children: detachable ARRAYED_LIST [P_C_OBJECT]

	existence: detachable STRING

	cardinality: detachable STRING

feature -- Status Report

	is_multiple: BOOLEAN

feature -- Factory

	create_c_attribute: C_ATTRIBUTE
			-- recreate original C_ATTRIBUTE
		local
			ex: detachable MULTIPLICITY_INTERVAL
			card: detachable CARDINALITY
		do
			if attached existence as att_ex then
				create ex.make_from_string (att_ex)
			end
			if is_multiple then
				if attached cardinality as att_card then
					create card.make_from_string (att_card)
				end
				create Result.make_multiple (rm_attribute_name, ex, card)
			else
				create Result.make_single (rm_attribute_name, ex)
			end

			if attached differential_path as dp then
				Result.set_differential_path (dp)
			end

			if attached children then
				across children as p_c_objs_csr loop
					if attached {P_C_ARCHETYPE_ROOT} p_c_objs_csr.item as p_c_ar then
						Result.put_child (p_c_ar.create_c_archetype_root)
					elseif attached {P_C_COMPLEX_OBJECT} p_c_objs_csr.item as p_c_co then
						Result.put_child (p_c_co.create_c_complex_object)
					elseif attached {P_ARCHETYPE_SLOT} p_c_objs_csr.item as p_a_s then
						Result.put_child (p_a_s.create_archetype_slot)
					elseif attached {P_C_COMPLEX_OBJECT_PROXY} p_c_objs_csr.item as p_a_ir then
						Result.put_child (p_a_ir.create_c_complex_object_proxy)
					elseif attached {P_C_PRIMITIVE_OBJECT} p_c_objs_csr.item as p_c_po then
						Result.put_child (p_c_po.create_c_primitive_object)
					end
				end
			end
		end

end


