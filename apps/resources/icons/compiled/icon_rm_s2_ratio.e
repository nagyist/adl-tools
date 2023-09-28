note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_RATIO

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/ratio"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,9E,B6,D5) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,5F,83,AE) A(00,00,00,00) A(99,65,8E,BF) A(F5,44,6A,98) A(2E,84,87,8B) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(0D,69,89,AF) A(C3,57,7F,AF) A(FF,4D,74,A2) A(FC,4E,73,9E) A(69,57,71,8F) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(E5,4D,70,99) A(EC,4D,67,87) A(FF,36,5B,87) A(38,83,86,8B) A(00,00,00,00) A(00,81,97,B3) A(00,00,00,00) A(00,00,00,00) A(4F,6B,84,A3) 
					A(BB,4D,67,85) A(63,48,60,7E) A(F7,3E,61,8B) A(FF,37,57,7D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(28,8F,A1,B7) A(51,79,91,AC) A(FF,35,5A,86) 
					A(38,83,86,8B) A(00,00,00,00) A(04,FF,FF,FF) A(FF,82,8D,9A) A(64,5F,68,72) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(CB,48,6A,93) A(FF,39,58,7D) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(5C,78,8F,AA) A(FF,35,59,86) A(38,83,86,8B) A(00,00,00,00) A(01,FF,FF,FF) A(CF,6D,76,82) 
					A(54,6B,73,7B) A(00,00,00,00) A(00,7A,9A,C0) A(1E,6B,8E,B8) A(FF,3E,65,94) A(B0,4C,60,7A) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(5C,78,8F,AA) A(FF,35,59,85) A(38,83,86,8C) A(00,00,00,00) A(00,84,97,AE) A(00,00,00,00) A(00,00,00,00) A(00,69,8C,B5) A(05,47,7C,BD) A(F4,4A,72,A1) 
					A(E9,42,5B,79) A(00,00,00,00) A(00,C9,CD,D4) A(00,00,00,00) A(00,6B,8A,AF) A(00,00,00,00) A(54,80,94,AC) A(FF,35,59,85) A(2E,92,8C,85) A(00,00,00,00) 
					A(00,00,00,00) A(55,83,9A,B5) A(19,88,9A,B2) A(06,FF,FF,FF) A(E9,49,71,A1) A(DA,3C,55,74) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(D7,55,78,A2) A(FA,43,69,96) A(FF,3C,60,8B) A(F7,45,6B,9A) A(83,46,5F,7E) A(0C,FF,FF,FF) A(FF,7A,7D,81) A(87,59,5D,63) A(80,60,7C,9F) 
					A(FF,37,5B,86) A(FF,4D,71,9D) A(FF,57,7B,A7) A(FF,58,7C,A8) A(5B,5D,6C,7D) A(00,00,00,00) A(00,00,00,00) A(29,4C,66,87) A(38,47,61,82) A(38,47,61,83) 
					A(38,45,5F,82) A(1A,63,7A,94) A(00,00,00,00) A(50,70,81,96) A(19,9C,A9,BB) A(11,87,9D,B8) A(39,42,5B,7D) A(38,44,5E,81) A(38,46,61,81) A(39,45,60,83) 
					A(0F,80,90,A3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
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