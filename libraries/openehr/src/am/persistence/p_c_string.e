note
	component:   "openEHR ADL Tools"
	description: "Persistent form of C_STRING"
	keywords:    "archetype, string"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_C_STRING

inherit
	P_C_PRIMITIVE_OBJECT
		redefine
			make, populate_c_instance
		end

create
	make, make_all

feature -- Initialisation

	make (a_cpo: C_STRING)
		do
			precursor (a_cpo)
			if not a_cpo.any_allowed then
				constraint := a_cpo.constraint
			end
		end

	make_all (a_cpo: C_STRING)
			-- make, including constraint even if it is open
		do
			make (a_cpo)
			constraint := a_cpo.constraint
		end

feature -- Access

	constraint: detachable ARRAYED_LIST [STRING]

feature -- Factory

	create_c_primitive_object: C_STRING
		do
			create Result.default_create
			populate_c_instance (Result)
		end

feature {NONE} -- Implementation

	populate_c_instance (a_c_o: C_STRING)
		do
			if attached constraint as att_c then
				a_c_o.set_constraint (att_c)
			end
			precursor (a_c_o)
		end

end


