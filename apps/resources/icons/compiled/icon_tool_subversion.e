note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_TOOL_SUBVERSION

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "tool/subversion"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(06,00,00,00) A(3B,00,00,00) A(22,00,00,00) A(02,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,04,05,07) 
					A(44,01,01,02) A(E6,2D,3B,58) A(D7,36,47,6A) A(90,17,1E,2D) A(42,03,04,07) A(0E,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(0A,00,00,00) A(AE,17,1F,2E) A(FF,65,86,C7) A(FF,74,9B,E7) A(FF,5F,80,C1) 
					A(F3,42,5A,88) A(C3,30,3B,4F) A(75,23,22,21) A(2D,01,01,00) A(06,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,05,06,0A) A(4E,00,00,00) A(F4,3D,52,7A) A(FF,72,99,E7) A(FF,73,99,E4) A(FF,89,A9,E9) A(FF,AF,C5,F0) A(FF,BF,CB,E4) A(FE,82,92,B0) A(E7,37,49,6D) 
					A(A9,1A,24,37) A(5A,06,09,0D) A(1A,00,00,00) A(02,00,00,00) A(00,00,00,00) A(00,00,00,00) A(0D,00,00,00) A(B6,17,20,32) A(FF,66,86,C4) A(FF,96,B3,EB) 
					A(FF,C4,D3,F1) A(FF,CE,DA,F2) A(FF,AA,BF,E7) A(FF,7E,9E,DC) A(FF,69,8E,D6) A(FF,63,88,D0) A(FF,56,76,B7) A(FA,3F,58,89) A(D5,23,31,4D) A(79,05,07,0B) 
					A(00,00,00,00) A(00,10,10,11) A(56,04,03,03) A(F7,65,70,85) A(FF,D1,DD,F5) A(FF,DA,E3,F4) A(FF,A3,BA,E5) A(FF,72,94,D7) A(FF,62,88,D1) A(FF,66,8A,D0) 
					A(FF,6F,90,D1) A(FF,7D,99,D2) A(FF,8A,A3,D5) A(FF,90,A8,D9) A(FF,58,6B,90) A(B0,05,07,0C) A(00,00,00,00) A(10,00,00,00) A(BE,3C,3C,3D) A(FF,DD,DD,DD) 
					A(FF,E9,EE,F6) A(FF,90,AA,DE) A(FF,7E,9C,D8) A(FF,94,AC,DB) A(FF,AF,C0,E1) A(FF,C7,D2,E5) A(FF,DA,DF,E9) A(FF,E4,E6,EA) A(FF,E8,E8,EA) A(FF,E6,E6,E7) 
					A(F4,5F,60,61) A(55,00,00,00) A(00,18,17,17) A(5D,06,06,06) A(F9,92,92,92) A(FF,FA,FA,F9) A(FF,F1,F2,F4) A(FF,E4,E8,EF) A(FF,E9,EB,EF) A(FF,EC,ED,EE) 
					A(FF,E5,E7,EB) A(FF,D4,DA,E5) A(FF,C2,CB,DE) A(FF,D9,DC,E3) A(FF,E9,E9,E8) A(FF,C3,C3,C3) A(C4,26,26,26) A(14,00,00,00) A(17,00,00,00) A(C4,35,38,3F) 
					A(FF,CA,CE,D7) A(FF,E0,E5,EE) A(FF,D3,DA,E8) A(FF,C1,CC,E2) A(FF,A7,B8,D9) A(FF,8C,A3,D0) A(FF,73,8F,C7) A(FF,61,81,C0) A(FF,76,91,C5) A(FF,CE,D3,DD) 
					A(FF,E0,E1,E3) A(FF,78,7A,7F) A(74,02,02,02) A(00,0E,0E,0E) A(76,03,04,07) A(FA,40,55,7F) A(FF,73,93,D3) A(FF,6E,8D,CB) A(FF,65,86,C6) A(FF,5C,7E,C2) 
					A(FF,55,78,BE) A(FF,53,76,BB) A(FF,64,83,BF) A(FF,99,AA,CD) A(FF,CB,D0,DA) A(FF,B9,C2,D3) A(FF,76,8B,B4) A(E3,1C,24,34) A(2A,00,00,00) A(00,00,00,00) 
					A(AA,04,05,08) A(FD,23,31,4B) A(FF,43,5D,91) A(FF,54,76,B8) A(FF,58,7B,C0) A(FF,58,7A,BD) A(FF,6C,89,C0) A(FF,9B,AB,CC) A(FF,BF,C6,D6) A(FF,AF,BA,CF) 
					A(FF,7A,90,BD) A(FF,53,72,B0) A(FF,34,4C,7C) A(A2,05,08,0D) A(04,00,00,00) A(00,00,00,00) A(1B,00,00,00) A(62,00,00,00) A(B9,07,09,0E) A(F1,18,22,35) 
					A(FF,39,4C,70) A(FF,8B,99,B3) A(FF,B6,C0,D3) A(FF,9C,AB,CA) A(FF,6B,85,B8) A(FF,4E,6D,AC) A(FF,46,67,A8) A(FF,46,66,A5) A(F7,1E,2C,47) A(4E,00,00,00) 
					A(00,00,00,01) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(0A,00,00,00) A(3F,00,00,00) A(91,05,05,05) A(DC,24,24,25) A(FC,30,3B,52) A(FF,37,50,81) 
					A(FF,44,63,A1) A(FF,47,67,A7) A(FF,45,65,A4) A(FF,39,54,89) A(C8,0C,11,1C) A(13,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(02,00,00,00) A(21,00,00,00) A(69,00,00,00) A(BE,06,09,0E) A(F3,15,1E,31) A(FF,29,3C,62) A(FF,3A,55,8D) A(FF,25,37,5A) 
					A(78,01,01,02) A(00,05,07,0C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(0C,00,00,00) A(43,00,00,00) A(96,02,02,04) A(DF,0B,11,1C) A(DC,09,0D,16) A(2C,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(03,00,00,00) 
					A(2B,00,00,00) A(3A,00,00,00) A(04,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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