note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_OPENEHR_WORK_PLAN

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/openehr/work_plan"
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
					A(EF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(EF,63,63,63) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(FE,66,66,66) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(BF,97,97,97) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) 
					A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) 
					A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(EF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(BE,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(BE,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) 
					A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) ;
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
					A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(BE,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) 
					A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) 
					A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(BE,96,96,96) A(FF,96,96,96) 
					A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) 
					A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) 
					A(FF,64,64,64) A(FF,8A,8A,8A) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) 
					A(BE,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(BE,96,96,96) A(FF,96,96,96) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(BE,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) 
					A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) 
					A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) ;
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
					A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) 
					A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,96,96,96) A(FF,96,96,96) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(BE,96,96,96) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,64,64) A(FF,64,64,64) A(FF,96,96,96) A(FF,97,97,97) A(FF,96,96,96) A(FF,96,96,96) 
					A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) 
					A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,96,96,96) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(EF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,66,66,66) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) 
					A(FF,64,64,64) A(FF,64,64,64) A(FF,64,64,64) A(EF,64,64,64) ;
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