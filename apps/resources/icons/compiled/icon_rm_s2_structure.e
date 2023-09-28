note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_STRUCTURE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/structure"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(6A,9F,AE,BF) 
					A(81,80,97,B3) A(01,FF,FF,FF) A(00,77,8E,AA) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(0F,EC,E8,E6) A(44,65,75,87) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(33,87,97,AD) A(FF,3B,5D,86) A(EE,4D,71,9E) A(5B,6A,84,A0) A(00,00,00,00) 
					A(00,00,00,00) A(0F,BA,BE,C3) A(A3,4B,66,87) A(FF,3D,5D,86) A(7F,49,51,5D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(14,FF,FF,FF) A(FF,37,52,73) A(FF,80,B6,ED) A(FF,5A,8A,C3) A(ED,60,80,A6) A(C2,51,6B,8B) A(FF,44,6A,99) A(FE,5F,91,CE) A(FF,33,55,7F) 
					A(5B,77,7B,80) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,56,6C,86) A(FF,4D,7C,B5) 
					A(FF,85,BB,F4) A(FF,8D,C3,FA) A(FF,63,97,D4) A(FF,6E,A3,E4) A(FF,56,88,C4) A(FF,26,43,65) A(3C,DA,D8,D4) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(D4,50,64,7D) A(FF,47,74,A9) A(FF,55,89,C7) A(FF,64,98,D7) A(FF,5E,93,D1) A(FF,57,8B,C9) 
					A(FF,4E,7E,B9) A(FF,32,46,61) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,4E,62,7C) A(1E,70,7F,90) 
					A(F9,3A,56,79) A(FF,4E,7D,B6) A(FF,56,89,C6) A(FF,56,8A,C8) A(FF,56,8A,C8) A(FF,56,8A,C8) A(FF,55,86,C0) A(FF,42,5F,82) A(1C,D8,DF,E4) A(00,AA,B7,C6) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,3D,54,6F) A(1E,53,63,78) A(FF,36,53,77) A(FE,54,86,C2) A(FF,59,8E,CC) A(FF,56,8B,C9) A(FF,57,8B,C9) 
					A(FF,57,8B,C9) A(FF,57,8B,C8) A(FF,69,9F,DE) A(FE,6E,A2,E0) A(FF,4F,6F,96) A(1E,F4,F2,F1) A(00,BB,C5,D2) A(00,00,00,00) A(00,3D,53,6D) A(1E,46,5B,75) 
					A(FF,35,55,7C) A(FE,55,84,BE) A(FF,5A,8B,C5) A(FF,57,89,C5) A(FF,57,8B,C8) A(FF,57,8B,C9) A(FF,56,8B,C9) A(FF,57,8A,C8) A(FF,56,89,C6) A(FF,67,9B,D8) 
					A(FE,6D,A2,E1) A(FF,59,77,9C) A(0E,FF,FF,FF) A(00,65,7D,98) A(00,00,00,00) A(C8,53,67,7F) A(FE,45,58,6E) A(FF,2D,43,5F) A(FF,35,4E,6E) A(FE,41,61,86) 
					A(FF,4C,75,A5) A(FF,55,88,C5) A(FF,56,8A,C8) A(FF,4C,78,AD) A(FF,46,6B,97) A(FF,3E,5F,86) A(FE,32,51,74) A(FF,33,51,75) A(E6,34,4F,71) A(07,B9,C0,CA) 
					A(00,B3,BE,CA) A(00,00,00,00) A(00,00,00,00) A(14,FF,FF,FF) A(47,6B,7D,92) A(A2,67,77,8A) A(FF,36,52,74) A(FF,50,7F,B8) A(FF,51,83,BE) A(FE,33,56,81) 
					A(E7,44,4E,5C) A(A3,4F,5D,6C) A(81,66,71,7F) A(47,5D,6C,7C) A(39,DE,E0,E2) A(0E,EC,ED,EF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(F0,6B,7D,94) A(FF,42,6A,99) A(FF,48,74,AB) A(FD,2A,3B,4E) A(0D,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,BE,C9,D8) A(47,AA,BA,CE) A(FF,37,53,74) 
					A(FF,30,50,78) A(7F,57,5C,62) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(C9,5D,72,8D) A(FF,36,45,55) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,BF,CA,D8) A(36,9A,AE,C9) A(89,81,87,8F) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
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