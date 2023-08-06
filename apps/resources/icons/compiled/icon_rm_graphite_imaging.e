note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_GRAPHITE_IMAGING

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/graphite/imaging"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,81,91,A3) A(FF,8A,9C,B3) A(FF,75,8A,A3) A(FF,94,A2,B1) A(FF,FF,FF,FF) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,5E,7D,A2) A(FF,5A,86,BB) 
					A(FF,43,74,AE) A(FF,41,72,AE) A(FF,41,71,AB) A(FF,3E,6D,A6) A(FF,44,6D,9F) A(FF,5E,78,97) A(FF,A2,A9,AF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,A3,AF,BF) A(FF,4F,7C,B1) A(FF,4A,79,B2) A(FF,93,A6,BE) A(FF,90,A3,B9) A(FF,69,8D,B7) A(FF,5E,81,AC) A(FF,61,77,92) 
					A(FF,9A,AC,C2) A(FF,3F,6B,A0) A(FF,3E,63,90) A(FF,7B,86,94) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A1,AE,BC) A(FF,4F,7D,B4) A(FF,61,81,AA) 
					A(FF,F9,FA,FB) A(FF,A0,AF,C0) A(FF,5E,95,D5) A(FF,98,CF,FF) A(FF,74,AA,EA) A(FF,4E,7D,B5) A(FF,50,61,76) A(FF,FF,FF,FF) A(FF,60,7E,A3) A(FF,36,5F,91) 
					A(FF,71,7B,88) A(00,00,00,00) A(FF,FB,F4,EB) A(FF,43,6E,A2) A(FF,5F,81,A9) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,33,5B,8A) A(FF,71,A6,E5) A(FF,5B,8E,CE) 
					A(FF,56,8A,C8) A(FF,51,83,BF) A(FF,28,4B,75) A(FF,D0,CF,CF) A(FF,FF,FF,FF) A(FF,63,81,A6) A(FF,31,54,7E) A(FF,6D,6F,72) A(FF,9A,A4,B1) A(FF,35,5C,8B) 
					A(FF,91,A5,BE) A(FF,FF,FF,FF) A(FF,FB,FB,FB) A(FF,2A,52,80) A(FF,55,89,C7) A(FF,56,8A,C9) A(FF,56,8A,C8) A(FF,51,84,C0) A(FF,33,55,7F) A(FF,AD,AF,B0) 
					A(FF,FF,FF,FF) A(FF,A0,B1,C7) A(FF,35,58,82) A(FF,56,60,6C) A(00,00,00,00) A(FF,6E,81,97) A(FF,30,58,88) A(FF,B0,BE,D0) A(FF,FF,FF,FF) A(FF,3F,59,7A) 
					A(FF,48,76,AD) A(FF,55,87,C3) A(FF,57,89,C6) A(FF,4D,79,AD) A(FF,10,2A,49) A(FF,F2,F1,F0) A(FF,BA,C6,D6) A(FF,33,58,84) A(FF,34,45,59) A(FF,FF,FF,FF) 
					A(00,00,00,00) A(00,00,00,00) A(FF,5A,70,8C) A(FF,2E,53,81) A(FF,7B,94,B2) A(FF,DD,E1,E5) A(FF,3B,59,7D) A(FF,3E,64,90) A(FF,4B,70,9A) A(FF,2C,47,67) 
					A(FF,8F,98,A2) A(FF,86,9D,B9) A(FF,36,59,84) A(FF,2D,41,58) A(FF,AE,B3,BA) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,7A,8D,A4) 
					A(FF,3E,5D,82) A(FF,2A,51,7F) A(FF,65,82,A6) A(FF,47,67,8E) A(FF,3A,59,7F) A(FF,4D,6C,90) A(FF,3C,61,8E) A(FF,32,4D,70) A(FF,4B,5C,70) A(FF,F8,FC,FD) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,AD,BB,D0) A(FF,5F,78,96) A(FF,5F,77,94) A(FF,3B,59,7D) 
					A(FF,3A,59,7A) A(FF,40,59,78) A(FF,5B,6F,85) A(FF,83,91,A3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,F1,F6,FC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
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