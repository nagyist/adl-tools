note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_URI_VALUE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/uri_value"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(2B,7B,9E,C8) A(50,73,92,B7) A(00,00,00,00) A(00,00,00,00) A(09,85,A0,C1) A(64,77,99,C3) 
					A(09,7C,83,8C) A(0C,8C,AE,D7) A(5F,7B,9B,C3) A(5C,7A,9A,C2) A(4B,73,94,BD) A(05,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(58,74,97,C2) A(23,80,96,B5) 
					A(A3,4D,6E,96) A(EF,32,52,78) A(00,00,00,00) A(00,00,00,00) A(3A,51,6F,92) A(FF,3A,5F,8C) A(3A,5E,66,71) A(5F,51,70,95) A(FF,3A,5F,8D) A(F0,41,61,88) 
					A(FF,38,5B,85) A(FF,3F,64,90) A(2E,66,73,83) A(00,00,00,00) A(FF,3C,63,92) A(82,43,57,6F) A(9F,4C,6D,94) A(EB,32,52,78) A(00,00,00,00) A(00,00,00,00) 
					A(38,53,70,94) A(FF,38,5E,8A) A(38,60,69,73) A(5C,51,70,95) A(FF,37,5A,85) A(09,9A,73,38) A(01,FF,FF,FF) A(FF,3D,62,8D) A(96,43,59,75) A(00,00,00,00) 
					A(FF,3C,63,91) A(7F,44,58,71) A(9F,4B,6C,93) A(EB,32,52,77) A(00,00,00,00) A(00,00,00,00) A(38,54,71,95) A(FF,38,5C,89) A(38,61,69,73) A(5C,51,71,96) 
					A(FF,36,58,83) A(47,88,9E,B6) A(68,71,95,C0) A(FF,37,5C,89) A(62,4A,5B,6F) A(00,00,00,00) A(FF,3C,63,91) A(7F,44,58,71) A(9F,4B,6B,92) A(EA,32,51,77) 
					A(00,00,00,00) A(00,00,00,00) A(38,54,71,94) A(FF,37,5C,89) A(38,61,69,73) A(5C,51,71,96) A(FF,3A,5F,8C) A(FF,46,67,8E) A(FF,35,59,84) A(A6,51,68,85) 
					A(00,00,00,00) A(00,00,00,00) A(FF,3C,63,91) A(7F,44,58,71) A(9D,4E,6D,93) A(FF,3C,5A,7F) A(00,00,00,00) A(00,5A,81,B0) A(41,51,6F,94) A(FF,37,5B,87) 
					A(35,6E,75,7C) A(5C,51,71,96) A(FF,37,5A,85) A(00,00,00,00) A(A4,47,64,89) A(FF,3A,5D,85) A(07,85,67,47) A(00,00,00,00) A(FF,3C,63,91) A(7F,44,58,71) 
					A(59,5A,73,92) A(FF,37,5D,8A) A(A2,55,71,93) A(4C,71,95,C1) A(D3,48,70,A2) A(FF,3B,58,7A) A(00,00,00,00) A(5C,51,71,96) A(FF,37,5B,86) A(14,6D,6A,62) 
					A(1A,9C,A9,B5) A(FF,3D,61,8D) A(84,3C,53,6E) A(00,00,00,00) A(FF,3C,63,91) A(7F,44,58,71) A(00,00,00,00) A(8B,57,72,92) A(F7,44,65,8B) A(FF,4B,6A,90) 
					A(D7,47,63,86) A(30,67,77,8B) A(00,00,00,00) A(4F,62,7F,A1) A(FB,42,60,85) A(0D,7C,77,6E) A(00,00,00,00) A(B3,4B,69,8D) A(D8,48,62,82) A(00,00,00,00) 
					A(F5,44,65,8C) A(70,57,6A,82) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,6E,86,A3) A(00,00,00,00) A(00,00,00,00) A(01,60,78,94) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
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