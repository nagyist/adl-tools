note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_GENERIC_CONTAINER_TYPE_CONCRETE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/generic/container_type_concrete"
			make_with_size (16, 16)
			fill_memory
		end

feature {NONE} -- Image data
	
	c_colors_0 (a_ptr: POINTER; a_offset: INTEGER)
			-- Fill `a_ptr' with colors data from `a_offset'.
		external
			"C inline"
		alias
			"{
				{
					#define B(q) #q
					#ifdef EIF_WINDOWS
						#define A(a,r,g,b) B(\x##b\x##g\x##r\x##a)
					#else
						#define A(a,r,g,b) B(\x##r\x##g\x##b\x##a)
					#endif

					char l_data[] =
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,34,60,C3) A(FF,34,60,C3) A(FF,34,60,C3) A(FF,34,60,C3) A(FF,34,60,C3) A(FF,34,60,C3) A(FF,34,60,C3) 
					A(FF,34,60,C3) A(FF,34,60,C3) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,34,60,C3) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,34,60,C3) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,84,84,84) A(FF,34,60,C3) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,34,60,C3) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,87,87,87) A(FF,86,86,86) A(FF,83,83,83) A(FF,84,84,84) 
					A(FF,82,82,82) A(FF,34,60,C3) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,34,60,C3) 
					A(FF,FF,FF,FF) A(FF,87,87,87) A(FF,86,86,86) A(FF,83,83,83) A(FF,84,84,84) A(FF,82,82,82) A(FF,83,83,83) A(FF,34,60,C3) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,34,60,C3) A(FF,87,87,87) A(FF,86,86,86) A(FF,86,86,86) A(FF,84,84,84) 
					A(FF,84,84,84) A(FF,83,83,83) A(FF,84,84,84) A(FF,34,60,C3) A(FF,34,60,C3) A(FF,34,60,C3) A(FF,34,60,C3) A(FF,34,60,C3) A(FF,34,60,C3) A(FF,34,60,C3) 
					A(FF,34,60,C3) A(FF,34,60,C3) A(FF,87,87,87) A(FF,86,86,86) A(FF,83,83,83) A(FF,84,84,84) A(FF,82,82,82) A(FF,84,84,84) A(FF,86,86,86) A(FF,87,87,87) 
					A(FF,8D,8D,8D) A(FF,9E,9E,9E) A(FF,AC,AC,AC) A(FF,C7,C7,C7) A(FF,D1,D1,D1) A(FF,E4,E4,E4) A(FF,EF,EF,EF) A(FF,FF,FF,FF) A(FF,86,86,86) A(FF,83,83,83) 
					A(FF,84,84,84) A(FF,82,82,82) A(FF,83,83,83) A(FF,86,86,86) A(FF,87,87,87) A(FF,8D,8D,8D) A(FF,92,92,92) A(FF,AC,AC,AC) A(FF,B9,B9,B9) A(FF,D1,D1,D1) 
					A(FF,D8,D8,D8) A(FF,EF,EF,EF) A(FF,F9,F9,F9) A(FF,FF,FF,FF) A(FF,86,86,86) A(FF,84,84,84) A(FF,84,84,84) A(FF,83,83,83) A(FF,84,84,84) A(FF,87,87,87) 
					A(FF,87,87,87) A(FF,92,92,92) A(FF,9E,9E,9E) A(FF,B9,B9,B9) A(FF,C7,C7,C7) A(FF,D8,D8,D8) A(FF,E4,E4,E4) A(FF,F9,F9,F9) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,84,84,84) A(FF,82,82,82) A(FF,84,84,84) A(FF,86,86,86) A(FF,87,87,87) A(FF,8D,8D,8D) A(FF,9E,9E,9E) A(FF,AC,AC,AC) A(FF,C7,C7,C7) 
					A(FF,D1,D1,D1) A(FF,E4,E4,E4) A(FF,EF,EF,EF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,83,83,83) A(FF,86,86,86) 
					A(FF,87,87,87) A(FF,8D,8D,8D) A(FF,92,92,92) A(FF,AC,AC,AC) A(FF,B9,B9,B9) A(FF,D1,D1,D1) A(FF,D8,D8,D8) A(FF,EF,EF,EF) A(FF,F9,F9,F9) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,9E,9E,9E) A(FF,B9,B9,B9) 
					A(FF,C7,C7,C7) A(FF,D8,D8,D8) A(FF,E4,E4,E4) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) ;
					memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
				}
			}"
		end

	build_colors (a_ptr: POINTER)
			-- Build `colors'
		do
			c_colors_0 (a_ptr, 0)
		end

end