note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_ORGANISATION

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/organisation"
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
					A(FF,C9,CA,CD) A(FF,9C,A0,A4) A(FF,95,A0,A3) A(FF,98,99,9C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,DE,C8,CB) A(FF,EB,8D,92) A(FF,A9,AF,B3) 
					A(FF,6E,6E,6F) A(FF,64,65,67) A(FF,8C,88,86) A(FF,84,85,87) A(FF,8C,8D,8E) A(FF,8F,8F,90) A(FF,7A,7A,7C) A(FF,77,7A,7C) A(FF,73,75,75) A(FF,7E,7F,7F) 
					A(FF,A6,A7,A9) A(00,00,00,00) A(00,00,00,00) A(FF,C4,D3,D7) A(FF,D2,BD,C1) A(FF,B4,B8,BB) A(FF,53,51,4F) A(FF,73,74,76) A(FF,67,68,6A) A(FF,71,72,73) 
					A(FF,85,86,88) A(FF,73,74,76) A(FF,66,68,69) A(FF,75,74,74) A(FF,5E,5C,5D) A(FF,5B,5C,5E) A(FF,8C,8D,90) A(00,00,00,00) A(00,00,00,00) A(FF,BA,C0,C3) 
					A(FF,AB,B9,C0) A(FF,C5,CC,D1) A(FF,B0,B4,B9) A(FF,A0,A4,A7) A(FF,90,93,95) A(FF,A0,A3,A6) A(FF,88,8A,8C) A(FF,7A,7B,7D) A(FF,78,76,73) A(FF,50,52,54) 
					A(FF,60,61,64) A(FF,81,89,91) A(FF,A9,A8,A7) A(00,00,00,00) A(00,00,00,00) A(FF,C2,C5,C8) A(FF,A5,B1,B9) A(FF,ED,FF,FF) A(FF,B1,B9,BF) A(FF,A3,AE,B5) 
					A(FF,DB,EC,F5) A(FF,B2,BF,C7) A(FF,B0,B6,BA) A(FF,C4,D0,D7) A(FF,B9,C0,C5) A(FF,A8,AC,B1) A(FF,8B,8B,8D) A(FF,55,7B,98) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,B3,B8,BB) A(FF,CB,D3,D8) A(FF,B6,C0,C6) A(FF,A6,AC,B0) A(FF,ED,FD,FF) A(FF,B0,C5,D1) A(FF,A3,A9,AD) A(FF,DF,FA,FF) 
					A(FF,BD,D7,E3) A(FF,B9,B6,B5) A(FF,47,74,93) A(FF,A3,AA,B2) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,BA,BF,C2) A(FF,B5,C3,CC) 
					A(FF,BA,C1,C5) A(FF,B6,BB,C0) A(FF,AD,B0,B4) A(FF,B8,BB,BE) A(FF,B1,B6,BA) A(FF,CF,D9,DF) A(FF,BD,C7,CD) A(FF,A6,AC,B1) A(FF,86,97,A5) A(FF,98,96,97) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,BC,C1,C5) A(FF,BE,CD,D3) A(FF,CA,DC,E5) A(FF,A7,A7,AA) A(FF,DC,F5,FF) A(FF,B1,C0,C9) 
					A(FF,AB,BA,C1) A(FF,C8,D2,D9) A(FF,B2,B9,BD) A(FF,8B,9A,A8) A(FF,67,7F,92) A(FF,DC,CE,C9) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,CF,D1,D4) A(FF,B5,B9,BE) A(FF,B9,BE,C1) A(FF,B2,B5,B9) A(FF,CD,D8,DE) A(FF,B5,C3,CA) A(FF,AA,BE,C9) A(FF,E6,FC,FF) A(FF,B3,B7,BB) A(FF,79,90,A2) 
					A(FF,9F,9C,9C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,AB,B0,B4) A(FF,D4,E9,F2) A(FF,B2,B6,B9) 
					A(FF,B7,C1,C7) A(FF,B3,B9,BF) A(FF,B4,B7,BB) A(FF,B7,BA,BD) A(FF,B2,B7,BB) A(FF,87,8D,94) A(FF,5B,7E,99) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,B1,B5,B9) A(FF,CD,D9,DF) A(FF,B4,BB,BF) A(FF,D0,DE,E5) A(FF,B5,C7,D2) A(FF,AF,C9,D6) A(FF,CD,DB,E3) 
					A(FF,B1,B0,AF) A(FF,67,88,A1) A(FF,AC,AB,AA) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,BC,C1,C4) 
					A(FF,B0,BE,C7) A(FF,B8,BC,C0) A(FF,B8,BD,C1) A(FF,BC,C0,C4) A(FF,B9,BF,C5) A(FF,BF,C7,CB) A(FF,A3,A6,AA) A(FF,87,90,9A) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,B1,C5,CF) A(FF,C7,CF,D4) A(FF,3A,3A,3D) A(FF,4D,4C,4F) 
					A(FF,D0,E5,EE) A(FF,B4,C2,CA) A(FF,7D,8D,9B) A(FF,70,9B,83) A(FF,F1,EF,A1) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,B3,BD,C6) A(FF,E7,FB,FF) A(FF,3C,3A,3D) A(FF,3D,3A,3D) A(FF,E0,FB,FF) A(FF,B8,C5,CE) A(FF,89,93,9C) A(FF,B1,B5,A6) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,82,A2,89) A(FF,BE,C7,CD) 
					A(FF,7D,80,84) A(FF,69,69,6B) A(FF,E7,FF,FF) A(FF,AE,B0,BB) A(FF,A5,AE,8C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,97,9B) A(FF,8C,8C,8E) A(FF,7E,BF,76) 
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