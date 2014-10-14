note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_CIMI_INTERVAL_VALUE_COUNT

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/cimi/interval_value_count"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(2B,93,A1,CA) A(29,8C,7D,94) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(6A,93,7E,95) A(F6,A8,36,42) 
					A(81,81,29,2C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(7A,A3,33,41) A(7F,83,29,2D) A(00,00,00,00) A(34,7A,A3,D6) A(82,6F,93,BE) 
					A(19,77,8D,AA) A(00,5C,6A,7B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(7D,A3,34,41) A(7D,84,2A,2B) A(00,00,00,00) A(9A,61,7A,9A) A(A1,42,5E,81) A(CC,37,53,77) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(53,85,64,7B) A(DD,9A,2A,38) A(E0,8F,27,33) A(3B,6E,5F,6E) 
					A(00,00,00,00) A(82,56,7B,A6) A(A6,40,57,72) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(04,FF,FF,FF) A(14,D6,FF,FF) A(14,D9,FF,FF) A(01,FF,FF,FF) A(49,72,97,C5) A(E6,4A,65,86) A(00,00,00,00) A(00,00,00,00) 
					A(0E,B7,CD,FF) A(2E,95,AF,E4) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,59,76,9A) A(FC,66,85,AA) A(FC,68,83,A2) A(00,00,00,00) A(D0,79,95,7F) A(EB,74,90,57) A(69,5B,6D,54) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,6B,84,A3) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(4A,8F,B0,AD) A(C3,6E,8A,6A) A(4E,6D,79,66) A(00,C4,C6,CA) A(00,00,00,00) A(00,00,00,00) A(3F,68,78,8D) A(7F,34,3D,4D) 
					A(87,50,5B,6C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(4F,6A,80,71) A(B9,6E,89,5E) 
					A(90,6A,80,5A) A(72,4F,5C,70) A(7F,37,41,52) A(4F,5E,6A,7C) A(7F,5C,7C,A2) A(FF,4B,72,A2) A(FF,4C,65,84) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(2C,80,96,B6) A(9C,7E,9A,78) A(C0,80,9F,70) A(9B,68,78,50) A(E7,60,85,B0) A(FF,3B,60,8B) A(9F,53,67,80) 
					A(7F,5B,7A,9F) A(FF,55,7D,AE) A(FF,4D,66,84) A(05,FF,FF,FF) A(14,FF,FF,F2) A(14,FF,FF,F2) A(14,FF,FF,F2) A(14,FF,FF,F2) A(14,FF,FF,F2) A(11,FF,FF,FF) 
					A(57,90,A0,9E) A(62,8F,9C,A0) A(06,FF,FF,FF) A(EC,66,89,B3) A(FF,44,69,96) A(9F,53,66,7F) A(7F,5B,7A,9F) A(FF,55,7D,AE) A(FE,3E,59,7A) A(FF,55,7E,B0) 
					A(FF,54,7C,AD) A(FF,54,7C,AD) A(FF,54,7C,AD) A(FF,54,7C,AD) A(FF,54,7C,AD) A(FF,54,7C,AD) A(FF,54,7C,AD) A(FF,54,7D,AD) A(FF,40,65,90) A(FF,51,71,98) 
					A(FF,44,69,96) A(9F,53,66,7F) A(7F,5B,7A,9F) A(FF,55,7D,AE) A(FE,3E,58,79) A(FF,38,5A,82) A(FF,38,59,82) A(FF,38,59,82) A(FF,38,59,82) A(FF,38,59,82) 
					A(FF,38,59,82) A(FF,38,59,82) A(FF,38,59,82) A(FF,38,59,82) A(FF,2D,49,6C) A(FF,52,72,99) A(FF,44,69,96) A(9F,53,66,7F) A(7F,5B,7A,9F) A(FF,55,7D,AE) 
					A(FF,49,62,81) A(51,79,8A,9E) A(5C,73,84,9A) A(5C,73,84,9A) A(5C,73,84,9A) A(5C,73,84,9A) A(5C,73,84,9A) A(5C,73,84,9A) A(5C,73,84,9A) A(5C,73,84,9A) 
					A(54,78,88,9B) A(F2,61,83,AD) A(FF,44,69,96) A(9F,53,66,7F) A(7F,5C,7B,A0) A(FF,54,7D,AE) A(FF,4E,67,85) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(EB,65,88,B3) A(FF,43,69,96) A(9F,54,66,7F) 
					A(50,69,82,9F) A(9F,42,5B,7B) A(A9,58,6E,89) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(93,58,71,8F) A(9F,44,5E,7E) A(63,63,76,8F) ;
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