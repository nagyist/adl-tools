note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_ACTION_SLOT

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/action_slot"
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
					A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) 
					A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) 
					A(FF,01,34,8D) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(FF,71,71,71) A(FF,6A,6A,6A) A(FF,5E,5E,5E) A(FF,7C,7C,7C) 
					A(FF,80,80,80) A(FF,7C,7C,7C) A(FF,67,67,67) A(FF,73,73,73) A(FF,99,99,99) A(00,00,00,00) A(FF,FF,FF,FF) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) 
					A(FF,CB,CB,CB) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(FF,F5,F5,F5) A(FF,8D,8D,8D) A(FF,A1,A1,A1) A(FF,97,97,97) A(FF,FD,FD,FD) A(00,00,00,00) 
					A(00,00,00,00) A(FF,D8,D8,D8) A(FF,AA,AA,AA) A(FF,FC,FC,FC) A(FF,00,00,80) A(FF,01,34,8D) A(FF,96,96,96) A(FF,A0,A0,A0) A(FF,B1,B1,B1) A(FF,C2,C2,C2) 
					A(FF,98,98,98) A(FF,B6,B6,B6) A(FF,CE,CE,CE) A(FF,A8,A8,A8) A(FF,96,96,96) A(FF,97,97,97) A(FF,AA,AA,AA) A(FF,8F,8F,8F) A(FF,84,84,84) A(FF,92,92,92) 
					A(FF,00,00,80) A(FF,01,34,8D) A(FF,71,71,71) A(FF,64,64,64) A(FF,68,68,68) A(FF,7F,7F,7F) A(FF,90,90,90) A(FF,91,91,91) A(FF,90,90,90) A(FF,91,91,91) 
					A(FF,8D,8D,8D) A(FF,7B,7B,7B) A(FF,54,54,54) A(FF,88,88,88) A(FF,9F,9F,9F) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) 
					A(FF,7B,7B,7B) A(FF,9B,9B,9B) A(FF,2E,2E,2E) A(FF,7A,7A,7A) A(FF,82,82,82) A(FF,6D,6D,6D) A(FF,54,54,54) A(FF,B5,B5,B5) A(FF,FF,FF,FF) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,CD,CD,CD) A(FF,A9,A9,A9) 
					A(FF,A9,A9,A9) A(FF,B7,B7,B7) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,7A,7A,7A) A(FF,74,74,74) A(FF,94,94,94) A(FF,95,95,95) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,7F,7F,7F) A(FF,6F,6F,6F) A(FF,C4,C4,C4) A(FF,A0,A0,A0) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,80,80,80) A(FF,71,71,71) A(FF,C3,C3,C3) A(FF,A1,A1,A1) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,81,81,81) A(FF,71,71,71) A(FF,C2,C2,C2) A(FF,A1,A1,A1) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,69,69,69) A(FF,6C,6C,6C) A(FF,71,71,71) 
					A(FF,C3,C3,C3) A(FF,8D,8D,8D) A(FF,5D,5D,5D) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,01,34,8D) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A0,A0,A0) A(FF,4F,4F,4F) A(FF,85,85,85) A(FF,B9,B9,B9) A(FF,77,77,77) A(FF,A0,A0,A0) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(FF,01,34,8D) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) 
					A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) 
					A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) A(FF,01,34,8D) ;
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