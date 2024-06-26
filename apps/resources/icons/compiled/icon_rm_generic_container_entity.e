note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_GENERIC_CONTAINER_ENTITY

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/generic/container_entity"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) 
					A(FF,00,00,00) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,27,75,D5) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,37,72,BB) A(FF,30,73,C6) A(FF,2C,73,CA) A(FF,27,75,D5) 
					A(FF,23,74,D9) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,00,00,00) 
					A(00,00,00,00) A(FF,37,72,BB) A(FF,33,72,C1) A(FF,2C,73,CA) A(FF,2A,74,D0) A(FF,23,74,D9) A(FF,20,75,DE) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,00,00,00) A(FF,39,71,B7) A(FF,33,72,C1) A(FF,30,73,C6) A(FF,2A,74,D0) 
					A(FF,27,75,D5) A(FF,20,75,DE) A(FF,1D,76,E3) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) 
					A(FF,00,00,00) A(FF,00,00,00) A(FF,37,72,BB) A(FF,30,73,C6) A(FF,2C,73,CA) A(FF,27,75,D5) A(FF,23,74,D9) A(FF,1D,76,E3) A(FF,1D,76,E5) A(FF,18,77,EC) 
					A(FF,2B,7E,E5) A(FF,47,89,DB) A(FF,55,8F,D7) A(FF,6A,98,D4) A(FF,71,9D,D7) A(FF,7C,A6,DE) A(FF,83,AC,E1) A(FF,91,B6,E7) A(FF,33,72,C1) A(FF,2C,73,CA) 
					A(FF,2A,74,D0) A(FF,23,74,D9) A(FF,20,75,DE) A(FF,1D,76,E5) A(FF,1B,77,E9) A(FF,2B,7E,E5) A(FF,38,83,E0) A(FF,55,8F,D7) A(FF,5F,94,D5) A(FF,71,9D,D7) 
					A(FF,76,A3,DA) A(FF,83,AC,E1) A(FF,8A,B1,E4) A(FF,96,BA,EA) A(FF,30,73,C6) A(FF,2A,74,D0) A(FF,27,75,D5) A(FF,20,75,DE) A(FF,1D,76,E3) A(FF,1B,77,E9) 
					A(FF,18,77,EC) A(FF,38,83,E0) A(FF,47,89,DB) A(FF,5F,94,D5) A(FF,6A,98,D4) A(FF,76,A3,DA) A(FF,7C,A6,DE) A(FF,8A,B1,E4) A(FF,91,B6,E7) A(FF,9D,BE,ED) 
					A(00,00,00,00) A(FF,27,75,D5) A(FF,23,74,D9) A(FF,1D,76,E3) A(FF,1D,76,E5) A(FF,18,77,EC) A(FF,2B,7E,E5) A(FF,47,89,DB) A(FF,55,8F,D7) A(FF,6A,98,D4) 
					A(FF,71,9D,D7) A(FF,7C,A6,DE) A(FF,83,AC,E1) A(FF,91,B6,E7) A(FF,96,BA,EA) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,20,75,DE) A(FF,1D,76,E5) 
					A(FF,1B,77,E9) A(FF,2B,7E,E5) A(FF,38,83,E0) A(FF,55,8F,D7) A(FF,5F,94,D5) A(FF,71,9D,D7) A(FF,76,A3,DA) A(FF,83,AC,E1) A(FF,8A,B1,E4) A(FF,96,BA,EA) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,47,89,DB) A(FF,5F,94,D5) 
					A(FF,6A,98,D4) A(FF,76,A3,DA) A(FF,7C,A6,DE) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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