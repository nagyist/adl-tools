note
	component:   "openEHR ADL Tools"
	description: "[
				 Abstract constrainer type for instances of temporal types; adds a second string
				 pattern constraint
				 ]"
	keywords:    "archetype, temporal"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class C_TEMPORAL [G -> ISO8601_TYPE create default_create, make_from_string end]

inherit
	C_ORDERED [G]
		rename
			set_constraint as set_comparable_constraint
		redefine
			c_value_conforms_to, c_value_congruent_to, assumed_value, any_allowed, valid_value, as_string
		end

	C_DATE_TIME_ROUTINES
		export
			{NONE} all;
		undefine
			default_create, out
		end

feature {NONE} -- Initialisation

	make_string_interval (a_lower_str, an_upper_str: detachable STRING)
			-- make from two iso8601 strings. Either may be Void, indicating an open-ended interval;
			-- they may also be the same, meaning a single point. Limits, where provided, are automatically
			-- included in the interval
		require
			valid_interval: attached a_lower_str or attached an_upper_str
			lower_valid: attached a_lower_str as l_str implies valid_string (l_str)
			upper_valid: attached an_upper_str as u_str implies valid_string (u_str)
			valid_order: (attached a_lower_str as l_str and attached an_upper_str as u_str) implies
						(string_to_item (l_str) <= string_to_item (u_str))
		local
			lower, upper: detachable G
			ivl: detachable INTERVAL [G]
		do
			default_create

			if attached a_lower_str as l_str then
				create lower.make_from_string (l_str)
			end
			if attached an_upper_str as u_str then
				create upper.make_from_string (u_str)
			end

			if attached lower as l and attached upper as u then
				if l.is_equal (u) then
					create {POINT_INTERVAL [G]} ivl.make (l)
				else
					create {PROPER_INTERVAL [G]} ivl.make_bounded (l, u, True, True)
				end
			elseif attached upper as u then
				create {PROPER_INTERVAL [G]} ivl.make_lower_unbounded (u, True)
			elseif attached lower as l then
				create {PROPER_INTERVAL [G]} ivl.make_upper_unbounded (l, True)
			end
			check attached ivl as att_ivl then
				constraint.extend (att_ivl)
			end
		end

	make_from_pattern (a_pattern: STRING)
			-- create Result from an ISO8601-based pattern like "yyyy-mm-XX"
		require
			a_pattern_valid: valid_pattern_constraint (a_pattern)
		do
			default_create
			pattern_constraint := a_pattern
		ensure
			pattern_set: pattern_constraint = a_pattern
		end

feature -- Access

	pattern_constraint: STRING
			-- extract the first item in `tuple_pattern_constraint'
		attribute
			create Result.make_empty
		end

	prototype_value: G
		do
			if not pattern_constraint.is_empty then
				-- FIXME: check against patterns
				create Result.default_create
			else
				create Result.default_create
			end
		end

	string_to_item (a_str: STRING): G
			-- convert `a_str' to an object of type G
		require
			valid_string (a_str)
		deferred
		end

	assumed_value: detachable ISO8601_TYPE

feature -- Status Report

	any_allowed: BOOLEAN
			-- True if any value allowed - only type is constrained
		do
			Result := precursor and pattern_constraint.is_empty
		end

	valid_value (a_value: G): BOOLEAN
		do
			if not pattern_constraint.is_empty then
				-- FIXME: check against patterns
				Result := True
			else
				Result := precursor (a_value)
			end
		end

	valid_assumed_value (a_value: attached like assumed_value): BOOLEAN
		do
			if attached {G} a_value as val then
				Result := valid_value (val)
			end
		end

	valid_string (a_str: STRING): BOOLEAN
			-- True if `a_str' is a valid string form of the data item G
		deferred
		end

	valid_pattern_constraint (a_pattern: STRING): BOOLEAN
		deferred
		end

	valid_pattern_constraint_replacement (a_pattern, an_other_pattern: STRING): BOOLEAN
		deferred
		end

feature -- Comparison

	c_value_conforms_to (other: like Current): BOOLEAN
			-- True if this node is a strict subset of `other'
		do
			Result := precursor (other) and
				other.pattern_constraint.is_empty or
					not pattern_constraint.is_empty and then
					valid_pattern_constraint_replacement (pattern_constraint, other.pattern_constraint)
		end

	c_value_congruent_to (other: like Current): BOOLEAN
			-- True if this node's value constraint is the same as that of `other'
		do
			Result := precursor (other) and
				pattern_constraint ~ other.pattern_constraint
		end

feature -- Output

	as_string: STRING
		do
			create Result.make_empty
			if not pattern_constraint.is_empty then
				Result.append (pattern_constraint)
			end
			if not constraint.is_empty then
				if not Result.is_empty then
					Result.append_character ('/')
				end
				Result.append (constraint_as_string)
			end
			if attached assumed_value as av then
				Result.append ("; " + av.as_string)
			end
		end

feature {P_C_TEMPORAL} -- Modification

	set_constraint (a_constraint: detachable like constraint; a_pattern_constraint: detachable like pattern_constraint)
		do
			if attached a_constraint as att_tpl then
				constraint := att_tpl
			end
			if attached a_pattern_constraint as att_tpl then
				pattern_constraint := att_tpl
			end
		end

end


