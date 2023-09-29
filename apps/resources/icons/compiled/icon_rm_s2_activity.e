note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_ACTIVITY

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/activity"
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
					A(00,00,00,00) A(00,00,00,00) A(60,71,93,BB) A(A0,56,76,9D) A(00,00,00,00) A(76,6F,8F,B6) A(9B,6E,92,C0) A(9B,70,94,BF) A(9B,6E,92,C0) A(78,6A,84,A3) 
					A(A9,5B,7F,AB) A(16,32,36,3D) A(00,00,00,00) A(94,67,8C,B8) A(4B,5F,73,8B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FC,42,64,8E) A(FF,3C,5D,84) 
					A(4F,41,4E,5E) A(5F,61,7A,97) A(83,57,6C,85) A(FF,2F,50,7A) A(83,4F,63,7C) A(52,59,6D,87) A(C4,43,65,8B) A(9D,3B,54,74) A(34,86,A0,BD) A(FF,38,59,80) 
					A(0F,FF,EF,DC) A(00,00,00,00) A(00,00,00,00) A(3C,62,7F,A3) A(FD,3E,5C,7F) A(83,46,66,8F) A(B0,40,5B,7D) A(00,00,00,00) A(10,EC,EA,E7) A(FF,32,55,7F) 
					A(10,89,78,5D) A(00,93,A4,B7) A(35,65,7A,92) A(FF,34,54,7B) A(A9,4C,6F,9A) A(A3,45,5A,73) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(97,50,76,A5) 
					A(88,3D,4F,65) A(25,62,6E,7D) A(FF,34,53,7A) A(00,00,00,00) A(0F,F1,ED,E8) A(FF,32,55,80) A(0F,8B,76,57) A(00,00,00,00) A(00,00,00,00) A(C6,42,62,88) 
					A(FF,35,54,78) A(0E,EB,DC,C9) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,46,69,94) A(FF,4A,6B,93) A(FF,51,72,9B) A(FF,3B,5F,8C) A(5D,3B,4B,5F) 
					A(0F,EF,EA,E5) A(FF,32,56,81) A(0F,8B,75,57) A(00,00,00,00) A(00,8C,9D,B1) A(7D,59,75,95) A(C6,31,50,76) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(4F,69,87,AA) A(FF,40,5D,81) A(00,00,00,00) A(00,00,00,00) A(A0,43,64,8C) A(C1,3E,5A,7C) A(09,FF,FF,FF) A(FF,30,54,80) A(10,85,70,56) A(00,00,00,00) 
					A(00,00,00,00) A(82,5A,77,9B) A(CA,2B,4B,70) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(2F,7E,94,AF) A(40,6F,81,97) A(00,00,00,00) A(00,FF,FF,FF) 
					A(20,7E,94,AD) A(5D,6B,7E,96) A(00,00,00,00) A(69,66,7D,98) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(27,7B,8F,A9) A(46,68,7D,95) A(1F,63,6F,7E) 
					A(29,68,83,A4) A(00,BB,C4,CF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(19,A9,AD,B3) A(47,4C,69,88) A(00,00,00,00) A(00,00,00,00) A(A0,4F,62,7A) A(C6,53,74,9C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,FF,FF,FF) A(B5,55,6B,87) A(66,59,6B,7F) 
					A(FF,36,53,76) A(FF,2E,50,78) A(D0,42,59,74) A(3E,63,79,92) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(80,54,6A,85) A(FF,3F,5E,87) A(B5,5E,7C,A0) A(FF,24,41,64) A(DB,41,57,73) A(34,87,8A,8F) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,76,87,9D) A(00,00,00,00) A(5F,5F,71,89) A(FA,3C,59,7C) A(FF,72,6A,3B) A(FF,83,82,53) 
					A(FF,5A,82,B3) A(CD,5F,73,8C) A(00,00,00,00) A(00,9D,A2,A7) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(3F,67,79,8E) A(E4,41,5B,7C) A(FF,67,65,43) A(FF,AA,91,28) A(FE,7B,7B,49) A(FF,31,4E,73) A(9F,40,52,68) A(1C,6F,6D,6D) A(78,53,6A,87) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(A7,53,66,7D) A(FF,3F,52,62) A(FE,78,75,44) A(FF,39,4E,5F) 
					A(B8,3F,57,75) A(1A,8C,89,8A) A(00,00,00,00) A(00,53,64,7A) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(A3,53,64,7A) A(C3,4A,60,7D) A(CC,3F,51,67) A(E1,3F,59,7C) A(34,83,87,8E) A(00,00,00,00) A(00,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(6A,54,67,7D) A(AA,50,60,75) A(09,FF,FF,FF) A(0A,C3,BF,B8) A(13,F2,EB,E6) 
					A(00,00,00,00) A(00,9A,9E,A4) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(62,5C,6B,7D) A(2E,72,7A,88) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
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