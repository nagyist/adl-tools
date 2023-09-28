note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_S2_HISTORY

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/s2/history"
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
					A(FF,CB,D4,DF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,CB,D4,DF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,CB,D4,DF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,CB,D4,DF) A(FF,7F,96,B3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,CB,D4,DF) A(FF,7F,96,B3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,CB,D4,DF) A(FF,7F,96,B3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,A6,B1,BF) A(FF,58,6A,82) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A6,B1,BF) A(FF,58,6A,82) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,A6,B1,BF) A(FF,58,6A,82) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A5,B0,BE) A(FF,57,6A,83) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,A5,B0,BE) A(FF,57,6A,83) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A5,B0,BE) A(FF,57,6A,83) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A5,B6,CB) A(FF,55,73,98) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A5,B6,CB) A(FF,55,73,98) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A5,B6,CB) A(FF,55,73,98) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A5,B6,CA) 
					A(FF,52,71,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A5,B6,CA) A(FF,52,71,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A5,B6,CA) 
					A(FF,52,71,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A5,B6,CA) A(FF,55,74,98) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,A5,B6,CA) A(FF,55,74,98) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A5,B6,CA) A(FF,55,74,98) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,A6,B5,C8) A(FF,5B,76,97) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A6,B5,C8) A(FF,5B,76,97) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,A6,B5,C8) A(FF,5B,76,97) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A8,B7,CA) A(FF,56,70,90) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,A8,B7,CA) A(FF,56,70,90) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A8,B7,CA) A(FF,56,70,90) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,50,71,99) A(FF,4F,6F,96) A(FF,4F,6F,96) A(FF,4F,6F,96) A(FF,50,70,97) A(FF,4F,6F,96) A(FF,4F,6F,96) A(FF,50,70,97) 
					A(FF,4F,6F,96) A(FF,4F,6F,96) A(FF,4F,6F,96) A(FF,4F,6F,96) A(FF,4F,6F,96) A(FF,4F,6F,96) A(FF,46,68,90) A(FF,52,69,85) A(FF,98,A7,B9) A(FF,98,A6,B8) 
					A(FF,98,A6,B8) A(FF,98,A6,B8) A(FF,98,A6,B8) A(FF,98,A6,B8) A(FF,98,A6,B8) A(FF,98,A6,B8) A(FF,98,A6,B8) A(FF,98,A6,B8) A(FF,98,A6,B8) A(FF,98,A6,B8) 
					A(FF,98,A6,B8) A(FF,97,A5,B6) A(FF,97,A8,BB) A(FF,A1,AC,BA) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
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