note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_GRAPHITE_CARE_ACT_ENTRY32X32

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/graphite/care_act_entry32x32"
			make_with_size (32, 32)
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,C5,CC,D5) 
					A(FF,CF,D5,DC) A(FF,62,78,92) A(FF,4E,69,8A) A(FF,4E,69,8A) A(FF,44,5E,7D) A(FF,44,5E,7D) A(FF,48,62,82) A(FF,48,62,82) A(FF,4E,68,87) A(FF,4E,68,87) 
					A(FF,7C,8E,A4) A(FF,CF,D5,DC) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,C5,CC,D5) A(FF,C5,CC,D5) A(FF,62,78,92) A(FF,62,78,92) A(FF,4E,69,8A) A(FF,4E,69,8A) A(FF,44,5E,7D) A(FF,44,5E,7D) A(FF,48,62,82) A(FF,48,62,82) 
					A(FF,4E,68,87) A(FF,4E,68,87) A(FF,7C,8E,A4) A(FF,7C,8E,A4) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,CF,D5,DC) A(FF,CF,D5,DC) A(FF,39,5E,8B) A(FF,39,5E,8B) A(FF,4C,7F,BA) A(FF,4C,7F,BA) A(FF,3B,66,9C) A(FF,3B,66,9C) A(FF,6F,82,9B) A(FF,6F,82,9B) 
					A(FF,5E,74,92) A(FF,5E,74,92) A(FF,34,5B,8B) A(FF,34,5B,8B) A(FF,34,5B,8B) A(FF,34,5B,8B) A(FF,45,61,84) A(FF,CF,D5,DC) A(FF,CF,D5,DC) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,CF,D5,DC) A(FF,6D,7F,95) A(FF,39,5E,8B) A(FF,39,5E,8B) A(FF,4C,7F,BA) A(FF,4C,7F,BA) A(FF,3B,66,9C) A(FF,3B,66,9C) 
					A(FF,6F,82,9B) A(FF,6F,82,9B) A(FF,5E,74,92) A(FF,5E,74,92) A(FF,34,5B,8B) A(FF,34,5B,8B) A(FF,34,5B,8B) A(FF,34,5B,8B) A(FF,45,61,84) A(FF,45,61,84) 
					A(FF,CF,D5,DC) A(FF,CF,D5,DC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,CF,D5,DC) A(FF,3B,60,8D) A(FF,3B,60,8D) A(FF,50,83,C0) A(FF,50,83,C0) A(FF,3D,6C,A4) A(FF,3D,6C,A4) 
					A(FF,79,8A,9F) A(FF,79,8A,9F) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,57,6F,8C) A(FF,57,6F,8C) A(FF,3B,63,92) A(FF,3B,63,92) 
					A(FF,3D,65,95) A(FF,3D,65,95) A(FF,4E,69,88) A(FF,CF,D5,DC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,CF,D5,DC) A(FF,CF,D5,DC) A(FF,3B,60,8D) A(FF,3B,60,8D) A(FF,50,83,C0) A(FF,50,83,C0) 
					A(FF,3D,6C,A4) A(FF,3D,6C,A4) A(FF,79,8A,9F) A(FF,CF,D5,DC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,CF,D5,DC) A(FF,57,6F,8C) 
					A(FF,3B,63,92) A(FF,3B,63,92) A(FF,3D,65,95) A(FF,3D,65,95) A(FF,4E,69,88) A(FF,4E,69,88) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,CF,D5,DC) A(FF,4F,68,87) A(FF,4E,80,BC) A(FF,4E,80,BC) 
					A(FF,50,83,C0) A(FF,50,83,C0) A(FF,52,6D,8F) A(FF,52,6D,8F) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,D6,DB,E2) A(FF,D6,DB,E2) A(FF,36,58,7F) A(FF,36,58,7F) A(FF,3F,67,97) A(FF,3F,67,97) A(FF,32,59,88) A(FF,32,59,88) A(FF,CF,D5,DC) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,4F,68,87) A(FF,4F,68,87) 
					A(FF,4E,80,BC) A(FF,4E,80,BC) A(FF,50,83,C0) A(FF,50,83,C0) A(FF,52,6D,8F) A(FF,52,6D,8F) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,D6,DB,E2) A(FF,D6,DB,E2) A(FF,36,58,7F) A(FF,36,58,7F) A(FF,3F,67,97) A(FF,3F,67,97) A(FF,32,59,88) A(FF,32,59,88) 
					A(FF,64,78,91) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,59,6F,8B) A(FF,59,6F,8B) A(FF,42,66,93) A(FF,42,66,93) 
					A(FF,3C,69,9E) A(FF,3C,69,9E) A(FF,4F,81,BD) A(FF,4F,81,BD) A(FF,4D,7E,B9) A(FF,4D,7E,B9) A(FF,39,5F,8E) A(FF,39,5F,8E) A(FF,36,52,76) A(FF,36,52,76) 
					A(FF,8D,9D,B0) A(FF,8D,9D,B0) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,B0,B9,C5) A(FF,65,7A,95) A(FF,3E,66,97) A(FF,3E,66,97) 
					A(FF,40,69,99) A(FF,40,69,99) A(FF,51,6C,8C) A(FF,CF,D5,DC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,CF,D5,DC) A(FF,59,6F,8B) 
					A(FF,42,66,93) A(FF,42,66,93) A(FF,3C,69,9E) A(FF,3C,69,9E) A(FF,4F,81,BD) A(FF,4F,81,BD) A(FF,4D,7E,B9) A(FF,4D,7E,B9) A(FF,39,5F,8E) A(FF,39,5F,8E) 
					A(FF,36,52,76) A(FF,36,52,76) A(FF,8D,9D,B0) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,B0,B9,C5) A(FF,65,7A,95) 
					A(FF,3E,66,97) A(FF,3E,66,97) A(FF,40,69,99) A(FF,40,69,99) A(FF,51,6C,8C) A(FF,51,6C,8C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,B8,C0,CB) A(FF,B8,C0,CB) A(FF,39,60,8F) A(FF,39,60,8F) A(FF,50,82,BF) A(FF,50,82,BF) A(FF,4E,80,BC) A(FF,4E,80,BC) A(FF,50,83,BF) A(FF,50,83,BF) 
					A(FF,3A,5E,8A) A(FF,3A,5E,8A) A(FF,39,60,8F) A(FF,93,A0,B1) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,CF,D5,DC) A(FF,7D,8D,A2) A(FF,30,57,86) A(FF,30,57,86) A(FF,3F,67,97) A(FF,3F,67,97) A(FF,2E,52,7D) A(FF,2E,52,7D) A(FF,E2,E5,EA) A(FF,E2,E5,EA) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,B8,C0,CB) A(FF,39,60,8F) A(FF,39,60,8F) A(FF,50,82,BF) A(FF,50,82,BF) A(FF,4E,80,BC) A(FF,4E,80,BC) 
					A(FF,50,83,BF) A(FF,50,83,BF) A(FF,3A,5E,8A) A(FF,3A,5E,8A) A(FF,93,A0,B1) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,CF,D5,DC) A(FF,7D,8D,A2) A(FF,30,57,86) A(FF,30,57,86) A(FF,3F,67,97) A(FF,3F,67,97) A(FF,2E,52,7D) A(FF,2E,52,7D) 
					A(FF,E2,E5,EA) A(FF,E2,E5,EA) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,7E,8F,A4) A(FF,39,60,8F) A(FF,3D,6C,A5) A(FF,3D,6C,A5) 
					A(FF,50,82,BF) A(FF,50,82,BF) A(FF,3A,5D,87) A(FF,3A,5D,87) A(FF,39,60,8F) A(FF,B0,B9,C5) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
					memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
				}
			}"
		end
	
	c_colors_1 (a_ptr: POINTER; a_offset: INTEGER)
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,CE,D3,DB) A(FF,CE,D3,DB) A(FF,2B,50,7C) A(FF,2B,50,7C) A(FF,3F,67,97) A(FF,3F,67,97) 
					A(FF,2D,54,82) A(FF,2D,54,82) A(FF,99,A6,B6) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,7E,8F,A4) 
					A(FF,3D,6C,A5) A(FF,3D,6C,A5) A(FF,50,82,BF) A(FF,50,82,BF) A(FF,3A,5D,87) A(FF,3A,5D,87) A(FF,B0,B9,C5) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,CE,D3,DB) A(FF,CE,D3,DB) A(FF,2B,50,7C) A(FF,2B,50,7C) 
					A(FF,3F,67,97) A(FF,3F,67,97) A(FF,2D,54,82) A(FF,2D,54,82) A(FF,99,A6,B6) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,5A,73,91) A(FF,5A,73,91) A(FF,3B,5D,86) A(FF,3B,5D,86) A(FF,39,60,8F) A(FF,C5,CB,D5) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,23,47,72) A(FF,23,47,72) A(FF,36,5E,8C) A(FF,36,5E,8C) A(FF,28,4E,7D) A(FF,28,4E,7D) A(FF,75,88,9E) A(FF,75,88,9E) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(00,00,00,00) A(FF,5A,73,91) A(FF,3B,5D,86) A(FF,3B,5D,86) A(FF,C5,CB,D5) A(FF,C5,CB,D5) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,23,47,72) A(FF,23,47,72) A(FF,36,5E,8C) A(FF,36,5E,8C) A(FF,28,4E,7D) A(FF,28,4E,7D) A(FF,75,88,9E) A(FF,75,88,9E) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,5C,73,8E) A(FF,5C,73,8E) A(FF,2F,54,80) A(FF,2F,54,80) A(FF,31,56,82) A(FF,31,56,82) 
					A(FF,4A,65,86) A(FF,4A,65,86) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A5,B1,C0) A(FF,A5,B1,C0) A(FF,32,51,77) A(FF,32,51,77) A(FF,B0,B9,C5) A(FF,B0,B9,C5) 
					A(FF,AD,B8,C6) A(FF,AD,B8,C6) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,5C,73,8E) A(FF,5C,73,8E) A(FF,2F,54,80) A(FF,2F,54,80) 
					A(FF,31,56,82) A(FF,31,56,82) A(FF,4A,65,86) A(FF,4A,65,86) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A5,B1,C0) A(FF,39,60,8F) A(FF,32,51,77) A(FF,32,51,77) 
					A(FF,63,78,92) A(FF,B0,B9,C5) A(FF,AD,B8,C6) A(FF,AD,B8,C6) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,6F,82,9A) A(FF,39,60,8F) 
					A(FF,3D,65,95) A(FF,3D,65,95) A(FF,3F,68,98) A(FF,3F,68,98) A(FF,44,62,86) A(FF,44,62,86) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,9A,A6,B4) A(FF,42,61,87) A(FF,42,61,87) 
					A(FF,4D,7F,BA) A(FF,4D,7F,BA) A(FF,37,62,94) A(FF,37,62,94) A(FF,B0,B9,C5) A(FF,B0,B9,C5) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,6F,82,9A) A(FF,39,60,8F) A(FF,3D,65,95) A(FF,3D,65,95) A(FF,3F,68,98) A(FF,3F,68,98) A(FF,44,62,86) A(FF,44,62,86) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,9A,A6,B4) A(FF,39,60,8F) 
					A(FF,42,61,87) A(FF,42,61,87) A(FF,4D,7F,BA) A(FF,4D,7F,BA) A(FF,37,62,94) A(FF,37,62,94) A(FF,B0,B9,C5) A(FF,B0,B9,C5) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,39,60,8F) A(FF,31,59,88) A(FF,31,59,88) A(FF,3F,67,97) A(FF,3F,67,97) A(FF,2A,4E,7A) A(FF,2A,4E,7A) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A6,B2,BE) 
					A(FF,35,58,82) A(FF,35,58,82) A(FF,4F,81,BC) A(FF,4F,81,BC) A(FF,4E,80,BC) A(FF,4E,80,BC) A(FF,51,83,C0) A(FF,39,60,8F) A(FF,36,5A,85) A(00,00,00,00) 
					A(FF,E1,E6,EA) A(FF,E1,E6,EA) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,39,60,8F) A(FF,31,59,88) A(FF,31,59,88) A(FF,3F,67,97) A(FF,3F,67,97) 
					A(FF,2A,4E,7A) A(FF,2A,4E,7A) A(FF,39,60,8F) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,A6,B2,BE) A(FF,39,60,8F) A(FF,35,58,82) A(FF,35,58,82) A(FF,4F,81,BC) A(FF,4F,81,BC) A(FF,4E,80,BC) A(FF,4E,80,BC) A(FF,51,83,C0) A(FF,51,83,C0) 
					A(FF,36,5A,85) A(FF,36,5A,85) A(FF,E1,E6,EA) A(FF,E1,E6,EA) A(00,00,00,00) A(00,00,00,00) A(FF,DF,E4,EA) A(FF,39,60,8F) A(FF,2F,52,7C) A(FF,2F,52,7C) 
					A(FF,3F,67,97) A(FF,3F,67,97) A(FF,35,5C,8B) A(FF,35,5C,8B) A(FF,62,77,90) A(FF,B0,B9,C5) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,7C,8E,A4) A(FF,24,45,6D) A(FF,24,45,6D) A(FF,34,5F,94) A(FF,34,5F,94) A(FF,4E,80,BB) A(FF,4E,80,BB) A(FF,4F,81,BD) A(FF,4F,81,BD) 
					A(FF,3F,6D,A4) A(FF,3F,6D,A4) A(FF,2E,58,8B) A(FF,2E,58,8B) A(FF,42,5C,7B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,DF,E4,EA) A(FF,DF,E4,EA) 
					A(FF,2F,52,7C) A(FF,2F,52,7C) A(FF,3F,67,97) A(FF,3F,67,97) A(FF,35,5C,8B) A(FF,35,5C,8B) A(FF,62,77,90) A(FF,B0,B9,C5) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,7C,8E,A4) A(FF,7C,8E,A4) A(FF,24,45,6D) A(FF,24,45,6D) A(FF,34,5F,94) A(FF,34,5F,94) A(FF,4E,80,BB) A(FF,4E,80,BB) 
					A(FF,4F,81,BD) A(FF,4F,81,BD) A(FF,3F,6D,A4) A(FF,3F,6D,A4) A(FF,2E,58,8B) A(FF,2E,58,8B) A(FF,42,5C,7B) A(FF,42,5C,7B) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,44,5F,7F) A(FF,44,5F,7F) A(FF,3E,67,97) A(FF,3E,67,97) A(FF,40,69,99) A(FF,40,69,99) A(FF,48,63,84) A(FF,48,63,84) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,52,6F,91) A(FF,52,6F,91) 
					A(FF,50,82,BF) A(FF,50,82,BF) A(FF,4E,80,BC) A(FF,4E,80,BC) A(FF,54,6D,8B) A(FF,54,6D,8B) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) ;
					memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
				}
			}"
		end
	
	c_colors_2 (a_ptr: POINTER; a_offset: INTEGER)
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,CF,D5,DC) A(FF,44,5F,7F) A(FF,3E,67,97) A(FF,3E,67,97) A(FF,40,69,99) A(FF,40,69,99) 
					A(FF,48,63,84) A(FF,48,63,84) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,52,6F,91) A(FF,52,6F,91) A(FF,50,82,BF) A(FF,50,82,BF) A(FF,4E,80,BC) A(FF,4E,80,BC) A(FF,54,6D,8B) A(FF,54,6D,8B) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,C3,CB,D4) A(FF,C3,CB,D4) A(FF,34,55,7C) A(FF,34,55,7C) 
					A(FF,40,68,98) A(FF,40,68,98) A(FF,32,59,88) A(FF,32,59,88) A(FF,75,87,9E) A(FF,B0,B9,C5) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,63,77,90) A(FF,63,77,90) A(FF,41,71,AA) A(FF,41,71,AA) A(FF,51,83,C0) A(FF,51,83,C0) A(FF,3B,60,8B) A(FF,3B,60,8B) A(FF,39,60,8F) A(FF,C2,CB,D4) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,C3,CB,D4) 
					A(FF,CF,D5,DC) A(FF,34,55,7C) A(FF,40,68,98) A(FF,40,68,98) A(FF,32,59,88) A(FF,32,59,88) A(FF,39,60,8F) A(FF,75,87,9E) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,63,77,90) A(FF,63,77,90) A(FF,41,71,AA) A(FF,41,71,AA) A(FF,51,83,C0) A(FF,51,83,C0) A(FF,3B,60,8B) A(FF,3B,60,8B) 
					A(FF,C2,CB,D4) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,CF,D5,DC) A(FF,CF,D5,DC) A(FF,36,56,7D) A(FF,36,56,7D) A(FF,3B,63,93) A(FF,3B,63,93) A(FF,31,57,85) A(FF,31,57,85) 
					A(FF,66,7C,96) A(FF,66,7C,96) A(FF,6E,83,9A) A(FF,6E,83,9A) A(FF,3E,6B,A2) A(FF,3E,6B,A2) A(FF,4C,7E,B9) A(FF,4C,7E,B9) A(FF,3C,61,8C) A(FF,3C,61,8C) 
					A(FF,39,60,8F) A(FF,82,91,A5) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,CF,D5,DC) A(FF,CF,D5,DC) A(FF,36,56,7D) A(FF,3B,63,93) A(FF,3B,63,93) 
					A(FF,31,57,85) A(FF,31,57,85) A(FF,66,7C,96) A(FF,66,7C,96) A(FF,6E,83,9A) A(FF,6E,83,9A) A(FF,3E,6B,A2) A(FF,3E,6B,A2) A(FF,4C,7E,B9) A(FF,4C,7E,B9) 
					A(FF,3C,61,8C) A(FF,3C,61,8C) A(FF,82,91,A5) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E0,E4,E8) A(FF,E0,E4,E8) 
					A(FF,64,79,93) A(FF,64,79,93) A(FF,42,5D,7F) A(FF,42,5D,7F) A(FF,3C,58,79) A(FF,3C,58,79) A(FF,3C,58,7A) A(FF,3C,58,7A) A(FF,43,60,82) A(FF,43,60,82) 
					A(FF,61,76,90) A(FF,61,76,90) A(FF,D4,D9,E0) A(FF,D4,D9,E0) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,E0,E4,E8) A(FF,E0,E4,E8) A(00,00,00,00) A(FF,CF,D5,DC) A(FF,42,5D,7F) A(FF,42,5D,7F) A(FF,3C,58,79) A(FF,3C,58,79) A(FF,3C,58,7A) A(FF,3C,58,7A) 
					A(FF,43,60,82) A(FF,43,60,82) A(FF,61,76,90) A(00,00,00,00) A(FF,D4,D9,E0) A(FF,D4,D9,E0) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
					memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
				}
			}"
		end

	build_colors (a_ptr: POINTER)
			-- Build `colors'
		do
			c_colors_0 (a_ptr, 0)
			c_colors_1 (a_ptr, 400)
			c_colors_2 (a_ptr, 800)
		end

end