note
	component:   "openEHR ADL Tools"
	description: "Validating parser for Archetype Description Language (ADL)"
	keywords:	 "ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CADL_15_PARSER

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		end

	CADL_15_SCANNER
		rename
			make as make_scanner
		redefine
			reset
		end

	C_COMMON

	OPERATOR_TYPES
		export
			{NONE} all
		end

	SHARED_ADL_APP_RESOURCES
		export
			{NONE} all
		end

	SHARED_C_FACTORY
		export
			{NONE} all
		end

	C_DATE_TIME_ROUTINES
		export
			{NONE} all
		end

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create
	make

feature {NONE} -- Implementation

	yy_build_parser_tables
			-- Build parser tables.
		do
			yytranslate := yytranslate_template
			yyr1 := yyr1_template
			yytypes1 := yytypes1_template
			yytypes2 := yytypes2_template
			yydefact := yydefact_template
			yydefgoto := yydefgoto_template
			yypact := yypact_template
			yypgoto := yypgoto_template
			yytable := yytable_template
			yycheck := yycheck_template
		end

	yy_create_value_stacks
			-- Create value stacks.
		do
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
			create yyspecial_routines3
			yyvsc3 := yyInitial_yyvs_size
			yyvs3 := yyspecial_routines3.make (yyvsc3)
			create yyspecial_routines4
			yyvsc4 := yyInitial_yyvs_size
			yyvs4 := yyspecial_routines4.make (yyvsc4)
			create yyspecial_routines5
			yyvsc5 := yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.make (yyvsc5)
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
			create yyspecial_routines7
			yyvsc7 := yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.make (yyvsc7)
			create yyspecial_routines8
			yyvsc8 := yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.make (yyvsc8)
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
			create yyspecial_routines10
			yyvsc10 := yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.make (yyvsc10)
			create yyspecial_routines11
			yyvsc11 := yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.make (yyvsc11)
			create yyspecial_routines12
			yyvsc12 := yyInitial_yyvs_size
			yyvs12 := yyspecial_routines12.make (yyvsc12)
			create yyspecial_routines13
			yyvsc13 := yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.make (yyvsc13)
			create yyspecial_routines14
			yyvsc14 := yyInitial_yyvs_size
			yyvs14 := yyspecial_routines14.make (yyvsc14)
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
			create yyspecial_routines17
			yyvsc17 := yyInitial_yyvs_size
			yyvs17 := yyspecial_routines17.make (yyvsc17)
			create yyspecial_routines18
			yyvsc18 := yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.make (yyvsc18)
			create yyspecial_routines19
			yyvsc19 := yyInitial_yyvs_size
			yyvs19 := yyspecial_routines19.make (yyvsc19)
			create yyspecial_routines20
			yyvsc20 := yyInitial_yyvs_size
			yyvs20 := yyspecial_routines20.make (yyvsc20)
			create yyspecial_routines21
			yyvsc21 := yyInitial_yyvs_size
			yyvs21 := yyspecial_routines21.make (yyvsc21)
			create yyspecial_routines22
			yyvsc22 := yyInitial_yyvs_size
			yyvs22 := yyspecial_routines22.make (yyvsc22)
			create yyspecial_routines23
			yyvsc23 := yyInitial_yyvs_size
			yyvs23 := yyspecial_routines23.make (yyvsc23)
			create yyspecial_routines24
			yyvsc24 := yyInitial_yyvs_size
			yyvs24 := yyspecial_routines24.make (yyvsc24)
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
			create yyspecial_routines26
			yyvsc26 := yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.make (yyvsc26)
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
			create yyspecial_routines28
			yyvsc28 := yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.make (yyvsc28)
			create yyspecial_routines29
			yyvsc29 := yyInitial_yyvs_size
			yyvs29 := yyspecial_routines29.make (yyvsc29)
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
			create yyspecial_routines35
			yyvsc35 := yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.make (yyvsc35)
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
			create yyspecial_routines44
			yyvsc44 := yyInitial_yyvs_size
			yyvs44 := yyspecial_routines44.make (yyvsc44)
			create yyspecial_routines45
			yyvsc45 := yyInitial_yyvs_size
			yyvs45 := yyspecial_routines45.make (yyvsc45)
			create yyspecial_routines46
			yyvsc46 := yyInitial_yyvs_size
			yyvs46 := yyspecial_routines46.make (yyvsc46)
			create yyspecial_routines47
			yyvsc47 := yyInitial_yyvs_size
			yyvs47 := yyspecial_routines47.make (yyvsc47)
			create yyspecial_routines48
			yyvsc48 := yyInitial_yyvs_size
			yyvs48 := yyspecial_routines48.make (yyvsc48)
			create yyspecial_routines49
			yyvsc49 := yyInitial_yyvs_size
			yyvs49 := yyspecial_routines49.make (yyvsc49)
			create yyspecial_routines50
			yyvsc50 := yyInitial_yyvs_size
			yyvs50 := yyspecial_routines50.make (yyvsc50)
			create yyspecial_routines51
			yyvsc51 := yyInitial_yyvs_size
			yyvs51 := yyspecial_routines51.make (yyvsc51)
			create yyspecial_routines52
			yyvsc52 := yyInitial_yyvs_size
			yyvs52 := yyspecial_routines52.make (yyvsc52)
			create yyspecial_routines53
			yyvsc53 := yyInitial_yyvs_size
			yyvs53 := yyspecial_routines53.make (yyvsc53)
			create yyspecial_routines54
			yyvsc54 := yyInitial_yyvs_size
			yyvs54 := yyspecial_routines54.make (yyvsc54)
			create yyspecial_routines55
			yyvsc55 := yyInitial_yyvs_size
			yyvs55 := yyspecial_routines55.make (yyvsc55)
			create yyspecial_routines56
			yyvsc56 := yyInitial_yyvs_size
			yyvs56 := yyspecial_routines56.make (yyvsc56)
			create yyspecial_routines57
			yyvsc57 := yyInitial_yyvs_size
			yyvs57 := yyspecial_routines57.make (yyvsc57)
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
			yyvsp3 := -1
			yyvsp4 := -1
			yyvsp5 := -1
			yyvsp6 := -1
			yyvsp7 := -1
			yyvsp8 := -1
			yyvsp9 := -1
			yyvsp10 := -1
			yyvsp11 := -1
			yyvsp12 := -1
			yyvsp13 := -1
			yyvsp14 := -1
			yyvsp15 := -1
			yyvsp16 := -1
			yyvsp17 := -1
			yyvsp18 := -1
			yyvsp19 := -1
			yyvsp20 := -1
			yyvsp21 := -1
			yyvsp22 := -1
			yyvsp23 := -1
			yyvsp24 := -1
			yyvsp25 := -1
			yyvsp26 := -1
			yyvsp27 := -1
			yyvsp28 := -1
			yyvsp29 := -1
			yyvsp30 := -1
			yyvsp31 := -1
			yyvsp32 := -1
			yyvsp33 := -1
			yyvsp34 := -1
			yyvsp35 := -1
			yyvsp36 := -1
			yyvsp37 := -1
			yyvsp38 := -1
			yyvsp39 := -1
			yyvsp40 := -1
			yyvsp41 := -1
			yyvsp42 := -1
			yyvsp43 := -1
			yyvsp44 := -1
			yyvsp45 := -1
			yyvsp46 := -1
			yyvsp47 := -1
			yyvsp48 := -1
			yyvsp49 := -1
			yyvsp50 := -1
			yyvsp51 := -1
			yyvsp52 := -1
			yyvsp53 := -1
			yyvsp54 := -1
			yyvsp55 := -1
			yyvsp56 := -1
			yyvsp57 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			yyvs1.keep_head (0)
			yyvs2.keep_head (0)
			yyvs3.keep_head (0)
			yyvs4.keep_head (0)
			yyvs5.keep_head (0)
			yyvs6.keep_head (0)
			yyvs7.keep_head (0)
			yyvs8.keep_head (0)
			yyvs9.keep_head (0)
			yyvs10.keep_head (0)
			yyvs11.keep_head (0)
			yyvs12.keep_head (0)
			yyvs13.keep_head (0)
			yyvs14.keep_head (0)
			yyvs15.keep_head (0)
			yyvs16.keep_head (0)
			yyvs17.keep_head (0)
			yyvs18.keep_head (0)
			yyvs19.keep_head (0)
			yyvs20.keep_head (0)
			yyvs21.keep_head (0)
			yyvs22.keep_head (0)
			yyvs23.keep_head (0)
			yyvs24.keep_head (0)
			yyvs25.keep_head (0)
			yyvs26.keep_head (0)
			yyvs27.keep_head (0)
			yyvs28.keep_head (0)
			yyvs29.keep_head (0)
			yyvs30.keep_head (0)
			yyvs31.keep_head (0)
			yyvs32.keep_head (0)
			yyvs33.keep_head (0)
			yyvs34.keep_head (0)
			yyvs35.keep_head (0)
			yyvs36.keep_head (0)
			yyvs37.keep_head (0)
			yyvs38.keep_head (0)
			yyvs39.keep_head (0)
			yyvs40.keep_head (0)
			yyvs41.keep_head (0)
			yyvs42.keep_head (0)
			yyvs43.keep_head (0)
			yyvs44.keep_head (0)
			yyvs45.keep_head (0)
			yyvs46.keep_head (0)
			yyvs47.keep_head (0)
			yyvs48.keep_head (0)
			yyvs49.keep_head (0)
			yyvs50.keep_head (0)
			yyvs51.keep_head (0)
			yyvs52.keep_head (0)
			yyvs53.keep_head (0)
			yyvs54.keep_head (0)
			yyvs55.keep_head (0)
			yyvs56.keep_head (0)
			yyvs57.keep_head (0)
		end

	yy_push_last_value (yychar1: INTEGER)
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		do
			inspect yytypes2.item (yychar1)
			when 1 then
				yyvsp1 := yyvsp1 + 1
				if yyvsp1 >= yyvsc1 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs1")
					end
					yyvsc1 := yyvsc1 + yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
				end
				yyspecial_routines1.force (yyvs1, last_detachable_any_value, yyvsp1)
			when 2 then
				yyvsp2 := yyvsp2 + 1
				if yyvsp2 >= yyvsc2 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs2")
					end
					yyvsc2 := yyvsc2 + yyInitial_yyvs_size
					yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
				end
				yyspecial_routines2.force (yyvs2, last_string_value, yyvsp2)
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs3")
					end
					yyvsc3 := yyvsc3 + yyInitial_yyvs_size
					yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
				end
				yyspecial_routines3.force (yyvs3, last_integer_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs4")
					end
					yyvsc4 := yyvsc4 + yyInitial_yyvs_size
					yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
				end
				yyspecial_routines4.force (yyvs4, last_real_value, yyvsp4)
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs5")
					end
					yyvsc5 := yyvsc5 + yyInitial_yyvs_size
					yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
				end
				yyspecial_routines5.force (yyvs5, last_character_value, yyvsp5)
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: not a token type: ")
					std.error.put_integer (yytypes2.item (yychar1))
					std.error.put_new_line
				end
				abort
			end
		end

	yy_push_error_value
			-- Push semantic value associated with token 'error'
			-- on top of corresponding value stack.
		local
			yyval1: detachable ANY
		do
			yyvsp1 := yyvsp1 + 1
			if yyvsp1 >= yyvsc1 then
				debug ("GEYACC")
					std.error.put_line ("Resize yyvs1")
				end
				yyvsc1 := yyvsc1 + yyInitial_yyvs_size
				yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
			end
			yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
		end

	yy_pop_last_value (yystate: INTEGER)
			-- Pop semantic value from stack when in state `yystate'.
		local
			yy_type_id: INTEGER
		do
			yy_type_id := yytypes1.item (yystate)
			inspect yy_type_id
			when 1 then
				yyvsp1 := yyvsp1 - 1
			when 2 then
				yyvsp2 := yyvsp2 - 1
			when 3 then
				yyvsp3 := yyvsp3 - 1
			when 4 then
				yyvsp4 := yyvsp4 - 1
			when 5 then
				yyvsp5 := yyvsp5 - 1
			when 6 then
				yyvsp6 := yyvsp6 - 1
			when 7 then
				yyvsp7 := yyvsp7 - 1
			when 8 then
				yyvsp8 := yyvsp8 - 1
			when 9 then
				yyvsp9 := yyvsp9 - 1
			when 10 then
				yyvsp10 := yyvsp10 - 1
			when 11 then
				yyvsp11 := yyvsp11 - 1
			when 12 then
				yyvsp12 := yyvsp12 - 1
			when 13 then
				yyvsp13 := yyvsp13 - 1
			when 14 then
				yyvsp14 := yyvsp14 - 1
			when 15 then
				yyvsp15 := yyvsp15 - 1
			when 16 then
				yyvsp16 := yyvsp16 - 1
			when 17 then
				yyvsp17 := yyvsp17 - 1
			when 18 then
				yyvsp18 := yyvsp18 - 1
			when 19 then
				yyvsp19 := yyvsp19 - 1
			when 20 then
				yyvsp20 := yyvsp20 - 1
			when 21 then
				yyvsp21 := yyvsp21 - 1
			when 22 then
				yyvsp22 := yyvsp22 - 1
			when 23 then
				yyvsp23 := yyvsp23 - 1
			when 24 then
				yyvsp24 := yyvsp24 - 1
			when 25 then
				yyvsp25 := yyvsp25 - 1
			when 26 then
				yyvsp26 := yyvsp26 - 1
			when 27 then
				yyvsp27 := yyvsp27 - 1
			when 28 then
				yyvsp28 := yyvsp28 - 1
			when 29 then
				yyvsp29 := yyvsp29 - 1
			when 30 then
				yyvsp30 := yyvsp30 - 1
			when 31 then
				yyvsp31 := yyvsp31 - 1
			when 32 then
				yyvsp32 := yyvsp32 - 1
			when 33 then
				yyvsp33 := yyvsp33 - 1
			when 34 then
				yyvsp34 := yyvsp34 - 1
			when 35 then
				yyvsp35 := yyvsp35 - 1
			when 36 then
				yyvsp36 := yyvsp36 - 1
			when 37 then
				yyvsp37 := yyvsp37 - 1
			when 38 then
				yyvsp38 := yyvsp38 - 1
			when 39 then
				yyvsp39 := yyvsp39 - 1
			when 40 then
				yyvsp40 := yyvsp40 - 1
			when 41 then
				yyvsp41 := yyvsp41 - 1
			when 42 then
				yyvsp42 := yyvsp42 - 1
			when 43 then
				yyvsp43 := yyvsp43 - 1
			when 44 then
				yyvsp44 := yyvsp44 - 1
			when 45 then
				yyvsp45 := yyvsp45 - 1
			when 46 then
				yyvsp46 := yyvsp46 - 1
			when 47 then
				yyvsp47 := yyvsp47 - 1
			when 48 then
				yyvsp48 := yyvsp48 - 1
			when 49 then
				yyvsp49 := yyvsp49 - 1
			when 50 then
				yyvsp50 := yyvsp50 - 1
			when 51 then
				yyvsp51 := yyvsp51 - 1
			when 52 then
				yyvsp52 := yyvsp52 - 1
			when 53 then
				yyvsp53 := yyvsp53 - 1
			when 54 then
				yyvsp54 := yyvsp54 - 1
			when 55 then
				yyvsp55 := yyvsp55 - 1
			when 56 then
				yyvsp56 := yyvsp56 - 1
			when 57 then
				yyvsp57 := yyvsp57 - 1
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown type id: ")
					std.error.put_integer (yy_type_id)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_run_geyacc
			-- You must run geyacc to regenerate this class.
		do
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER)
			-- Execute semantic action.
		local
			yy_retried: BOOLEAN
			yyval1: detachable ANY
			yyval15: C_COMPLEX_OBJECT
			yyval10: SIBLING_ORDER
			yyval8: C_ARCHETYPE_ROOT
			yyval9: ARCHETYPE_INTERNAL_REF
			yyval17: ARCHETYPE_SLOT
			yyval16: C_PRIMITIVE_OBJECT
			yyval18: C_ATTRIBUTE
			yyval6: detachable ARRAYED_LIST [ASSERTION]
			yyval7: ASSERTION
			yyval19: EXPR_ITEM
			yyval21: EXPR_BINARY_OPERATOR
			yyval20: EXPR_UNARY_OPERATOR
			yyval2: STRING
			yyval22: EXPR_LEAF
			yyval13: detachable MULTIPLICITY_INTERVAL
			yyval11: MULTIPLICITY_INTERVAL
			yyval14: detachable CARDINALITY
			yyval12: CARDINALITY
			yyval56: C_INTEGER
			yyval55: C_REAL
			yyval53: C_DATE
			yyval54: C_TIME
			yyval51: C_DATE_TIME
			yyval52: C_DURATION
			yyval50: C_STRING
			yyval57: C_TERMINOLOGY_CODE
			yyval49: C_BOOLEAN
			yyval29: ARRAYED_LIST [STRING]
			yyval3: INTEGER
			yyval30: ARRAYED_LIST [INTEGER]
			yyval37: INTERVAL [INTEGER]
			yyval43: ARRAYED_LIST [INTERVAL [INTEGER]]
			yyval4: REAL
			yyval31: ARRAYED_LIST [REAL]
			yyval38: INTERVAL [REAL]
			yyval44: ARRAYED_LIST [INTERVAL [REAL]]
			yyval23: BOOLEAN
			yyval32: ARRAYED_LIST [BOOLEAN]
			yyval24: ISO8601_DATE
			yyval33: ARRAYED_LIST [ISO8601_DATE]
			yyval40: INTERVAL [ISO8601_DATE]
			yyval46: ARRAYED_LIST [INTERVAL [ISO8601_DATE]]
			yyval26: ISO8601_TIME
			yyval34: ARRAYED_LIST [ISO8601_TIME]
			yyval39: INTERVAL [ISO8601_TIME]
			yyval45: ARRAYED_LIST [INTERVAL [ISO8601_TIME]]
			yyval25: ISO8601_DATE_TIME
			yyval35: ARRAYED_LIST [ISO8601_DATE_TIME]
			yyval41: INTERVAL [ISO8601_DATE_TIME]
			yyval47: ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]
			yyval27: ISO8601_DURATION
			yyval36: ARRAYED_LIST [ISO8601_DURATION]
			yyval42: INTERVAL [ISO8601_DURATION]
			yyval48: ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]
		do
			if not yy_retried then
				inspect yy_act
when 1 then
--|#line 173 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 173")
end

			debug ("ADL_parse")
				io.put_string ("CADL definition parsed%N")
			end
			output := yyvs1.item (yyvsp1)
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 181 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 181")
end

			debug ("ADL_parse")
				io.put_string ("assertion definition parsed%N")
			end
			output := yyvs6.item (yyvsp6)
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp6 := yyvsp6 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 189 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 189")
end

			debug ("ADL_parse")
				io.put_string ("CADL definition NOT parsed%N")
			end
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 198 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 198")
end

			debug ("ADL_parse")
				io.put_string (indent + "POP OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "]%N") 
				indent.remove_tail (1)
			end
			yyval1 := object_nodes.item
			object_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp15 := yyvsp15 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 207 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 207")
end

			-- ok in case where occurrences or node_id is being redefined in a specialised archetype or template
			debug ("ADL_parse")
				io.put_string (indent + "POP OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "]%N") 
				indent.remove_tail (1)
			end
			yyval1 := object_nodes.item
			object_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp15 := yyvsp15 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 219 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 219")
end

			yyval15 := yyvs15.item (yyvsp15)
			if attached yyvs13.item (yyvsp13) as att_occ then
				yyvs15.item (yyvsp15).set_occurrences (att_occ)
			end

			if rm_schema.has_class_definition (yyvs15.item (yyvsp15).rm_type_name) then
				object_nodes.extend (yyvs15.item (yyvsp15))
debug ("ADL_parse")
	io.put_string (indent + "PUSH create OBJECT_NODE " + yyvs15.item (yyvsp15).rm_type_name + " [id=" + yyvs15.item (yyvsp15).node_id + "] ")
	if yyvs13.item (yyvsp13) /= Void then
		io.put_string ("; occurrences=(" + yyvs13.item (yyvsp13).as_string + ")") 
	end
	io.new_line
	indent.append ("%T")
end

				-- put it under current attribute, unless it is the root object, in which case it will be returned
				-- via the 'output' attribute of this parser
				if not c_attrs.is_empty then
					safe_put_c_attribute_child (c_attrs.item, yyvs15.item (yyvsp15))
				end
			else
				abort_with_error (ec_VCORM, <<yyvs15.item (yyvsp15).rm_type_name, yyvs15.item (yyvsp15).path>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp13 := yyvsp13 -1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 7 then
--|#line 248 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 248")
end

			if object_nodes.is_empty then
				create yyval15.make_identified (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VARCN, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp15 := yyvsp15 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 8 then
--|#line 256 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 256")
end

			if not object_nodes.is_empty then
				create yyval15.make_identified (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VARND, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp15 := yyvsp15 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 9 then
--|#line 267 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 267")
end

			create yyval15.make_anonymous (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 10 then
--|#line 274 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 274")
end

			create yyval15.make_identified (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			yyval15.set_sibling_order (yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp15 := yyvsp15 + 1
	yyvsp10 := yyvsp10 -1
	yyvsp2 := yyvsp2 -2
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 11 then
--|#line 281 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 281")
end

			yyval10 := create {SIBLING_ORDER}.make_after (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp10 >= yyvsc10 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs10")
		end
		yyvsc10 := yyvsc10 + yyInitial_yyvs_size
		yyvs10 := yyspecial_routines10.aliased_resized_area (yyvs10, yyvsc10)
	end
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
when 12 then
--|#line 285 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 285")
end

			yyval10 := create {SIBLING_ORDER}.make_before (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp10 := yyvsp10 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp10 >= yyvsc10 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs10")
		end
		yyvsc10 := yyvsc10 + yyInitial_yyvs_size
		yyvs10 := yyspecial_routines10.aliased_resized_area (yyvs10, yyvsc10)
	end
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
when 13 then
--|#line 291 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 291")
end

			debug ("ADL_parse")
				io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + 
					" [id=" + object_nodes.item.node_id + "] - any_allowed%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 298 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 298")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 301 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 301")
end

			abort_with_error (ec_SCOAT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 311 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 311")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 314 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 314")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 318 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 318")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 322 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 322")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs17.item (yyvsp17))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 326 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 326")
end

			safe_put_c_attribute_child (c_attrs.item, yyvs16.item (yyvsp16))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 330 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 330")
end

			abort_with_error (ec_SCCOG, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 341 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 341")
end

			if archetype_id_parser.valid_id (yyvs2.item (yyvsp2)) then
				create yyval8.make_external_ref (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
				if attached yyvs13.item (yyvsp13) as occ then
					yyval8.set_occurrences (occ)
				end
			else
				abort_with_error (ec_SUAIDI, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -2
	yyvsp13 := yyvsp13 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 23 then
--|#line 352 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 352")
end

			if archetype_id_parser.valid_id (yyvs2.item (yyvsp2)) then
				create yyval8.make_slot_filler (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
				if attached yyvs13.item (yyvsp13) as occ then
					yyval8.set_occurrences (occ)
				end
			else
				abort_with_error (ec_SUAIDI, <<yyvs2.item (yyvsp2 - 1)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -3
	yyvsp13 := yyvsp13 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 24 then
--|#line 363 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 363")
end

			abort_with_error (ec_SUAID, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp8 := yyvsp8 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 25 then
--|#line 369 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 369")
end

			create og_path.make_from_string (yyvs2.item (yyvsp2))
			if attached arch_internal_ref_node_id as air_node_id then
				create yyval9.make_identified (arch_internal_ref_rm_type_name, air_node_id, yyvs2.item (yyvsp2))
			else
				create yyval9.make (arch_internal_ref_rm_type_name, yyvs2.item (yyvsp2))

				-- if the C_ATTRIBUTE above this node requires that this node has an identifier, then take it from the target path
				if c_attrs.item.candidate_child_requires_id (yyval9.rm_type_name) then
					-- default to the id from the target path
					if not og_path.last.object_id.is_empty then
						yyval9.set_node_id (og_path.last.object_id)
					else
						-- error will be generated when attempt is made to add this object to C_ATTRIBUTE
					end
				end

			end
			if attached yyvs13.item (yyvsp13) as att_occ then
				yyval9.set_occurrences (att_occ)
			end

			debug ("ADL_parse")
				io.put_string (indent + "create ARCHETYPE_INTERNAL_REF ")
				io.put_string (yyval9.rm_type_name) 
				if yyval9.is_addressable then
					io.put_string ("[" + yyval9.node_id + "] ")
				else
					io.put_string (" ")
				end
				if yyval9.use_target_occurrences then
					io.put_string ("occurrences=(use target) ")
				elseif yyvs13.item (yyvsp13) /= Void then
					io.put_string ("occurrences=" + yyval9.occurrences.as_string + " ")
				end
				io.put_string (" => " + yyval9.target_path + "%N") 
				io.put_string (indent + "C_ATTR " + c_attrs.item.rm_attribute_name + " safe_put_c_attribute_child (ARCHETYPE_INTERNAL_REF)%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp13 := yyvsp13 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 26 then
--|#line 409 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 409")
end

			abort_with_error (ec_SUNPA, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 27 then
--|#line 415 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 415")
end

			arch_internal_ref_rm_type_name := yyvs2.item (yyvsp2 - 1)
			arch_internal_ref_node_id := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 423 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 423")
end

			arch_internal_ref_rm_type_name := yyvs2.item (yyvsp2)
			arch_internal_ref_node_id := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 29 then
--|#line 433 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 433")
end

			if attached yyvs6.item (yyvsp6 - 1) as att_c_incs then
				yyvs17.item (yyvsp17).set_includes (att_c_incs)
			end
			if attached yyvs6.item (yyvsp6) as att_c_excs then
				yyvs17.item (yyvsp17).set_excludes (att_c_excs)
			end

			debug ("ADL_parse")
				indent.remove_tail (1)
			end
			yyval17 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp6 := yyvsp6 -2
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 30 then
--|#line 447 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 447")
end

			if not (yyvs17.item (yyvsp17).is_closed or yyvs17.item (yyvsp17).is_prohibited) then
				abort_with_error (ec_VASMD, <<yyvs17.item (yyvsp17).rm_type_name, c_attrs.item.path>>)
			end
			yyval17 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 31 then
--|#line 456 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 456")
end

			if attached yyvs13.item (yyvsp13) as att_occ then
				yyvs17.item (yyvsp17).set_occurrences (att_occ)
			end

			debug ("ADL_parse")
				io.put_string (indent + "create ARCHETYPE_SLOT " + yyvs17.item (yyvsp17).rm_type_name + " [id=" + yyvs17.item (yyvsp17).node_id + "]")
				if attached yyvs13.item (yyvsp13) then
					io.put_string ("; occurrences=(" + yyvs13.item (yyvsp13).as_string + ")") 
				end
				io.new_line
				indent.append ("%T")
			end
			yyval17 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp13 := yyvsp13 -1
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 32 then
--|#line 474 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 474")
end

			create yyval17.make_identified (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -2
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 33 then
--|#line 478 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 478")
end

			create yyval17.make_identified (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			yyval17.set_sibling_order (yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp17 := yyvsp17 + 1
	yyvsp10 := yyvsp10 -1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -2
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 34 then
--|#line 483 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 483")
end

			create yyval17.make_identified (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			yyval17.set_closed
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -2
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 35 then
--|#line 491 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 491")
end

			create yyval17.make_anonymous (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 36 then
--|#line 498 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 498")
end

			abort_with_error (ec_SUAS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp17 := yyvsp17 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 37 then
--|#line 504 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 504")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_INTEGER: " +  yyvs56.item (yyvsp56).as_string + "%N")
			end
			yyval16 := yyvs56.item (yyvsp56)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp56 := yyvsp56 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 38 then
--|#line 511 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 511")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_REAL: " +  yyvs55.item (yyvsp55).as_string + "%N")
			end
			yyval16 := yyvs55.item (yyvsp55)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp55 := yyvsp55 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 39 then
--|#line 518 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 518")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE: " +  yyvs53.item (yyvsp53).as_string + "%N")
			end
			yyval16 := yyvs53.item (yyvsp53)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp53 := yyvsp53 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 40 then
--|#line 525 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 525")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TIME: " +  yyvs54.item (yyvsp54).as_string + "%N")
			end
			yyval16 := yyvs54.item (yyvsp54)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp54 := yyvsp54 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 41 then
--|#line 532 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 532")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DATE_TIME: " +  yyvs51.item (yyvsp51).as_string + "%N")
			end
			yyval16 := yyvs51.item (yyvsp51)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp51 := yyvsp51 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 42 then
--|#line 539 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 539")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_DURATION: " +  yyvs52.item (yyvsp52).as_string + "%N")
			end
			yyval16 := yyvs52.item (yyvsp52)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp52 := yyvsp52 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 43 then
--|#line 546 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 546")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_STRING: " +  yyvs50.item (yyvsp50).as_string + "%N")
			end
			yyval16 := yyvs50.item (yyvsp50)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp50 := yyvsp50 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 44 then
--|#line 553 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 553")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_TERMINOLOGY_CODE: " +  yyvs57.item (yyvsp57).as_string + "%N")
			end
			yyval16 := yyvs57.item (yyvsp57)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp57 := yyvsp57 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 45 then
--|#line 560 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 560")
end

			debug ("ADL_parse")
				io.put_string (indent + "C_BOOLEAN: " +  yyvs49.item (yyvsp49).as_string + "%N")
			end
			yyval16 := yyvs49.item (yyvsp49)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp49 := yyvsp49 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 46 then
--|#line 569 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 569")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 47 then
--|#line 576 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 576")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 579 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 579")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 584 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 584")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 587 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 587")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 51 then
--|#line 592 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 592")
end

			debug ("ADL_parse")
				io.put_string (indent + "POP ATTR_NODE " + c_attrs.item.rm_attribute_name + "%N") 
				indent.remove_tail (1)
			end
			c_attrs.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 52 then
--|#line 600 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 600")
end

			c_attrs.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 53 then
--|#line 604 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 604")
end

			abort_with_error (ec_SCAS, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp18 := yyvsp18 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 54 then
--|#line 610 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 610")
end

			rm_attribute_name := yyvs2.item (yyvsp2)
			if not object_nodes.item.has_attribute (rm_attribute_name) then
				if rm_schema.has_property (object_nodes.item.rm_type_name, rm_attribute_name) then
					rm_prop_def := rm_schema.property_definition (object_nodes.item.rm_type_name, rm_attribute_name)
					if rm_prop_def.is_container then
						create yyval18.make_multiple (rm_attribute_name, yyvs13.item (yyvsp13), yyvs14.item (yyvsp14))
						c_attrs.put (yyval18)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + yyval18.is_multiple.out)
	if attached yyvs13.item (yyvsp13) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	if attached yyvs14.item (yyvsp14) as att_card then io.put_string ("; cardinality=(" + att_card.as_string + ")") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval18)

					elseif not attached yyvs14.item (yyvsp14) then
						create yyval18.make_single (rm_attribute_name, yyvs13.item (yyvsp13))
						c_attrs.put (yyval18)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + rm_attribute_name + "; container = " + yyval18.is_multiple.out) 
	if attached yyvs13.item (yyvsp13) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval18)
					else -- error - cardinality stated, but on a non-container attribute
						abort_with_error (ec_VSAM2, <<rm_attribute_name>>)
					end
				else
					abort_with_error (ec_VCARM, <<rm_attribute_name, object_nodes.item.path, object_nodes.item.rm_type_name>>)
				end
			else
				abort_with_error (ec_VCATU, <<rm_attribute_name>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp14 := yyvsp14 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 55 then
--|#line 650 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 650")
end

			create og_path.make_from_string (yyvs2.item (yyvsp2))
			rm_attribute_name := og_path.last.attr_name
			parent_path_str := og_path.parent_path.as_string

			if not object_nodes.item.has_attribute (yyvs2.item (yyvsp2)) then
				-- check RM to see if path is valid, and if it is a container
				if rm_schema.has_property_path (object_nodes.item.rm_type_name, yyvs2.item (yyvsp2)) then
					rm_prop_def := rm_schema.property_definition_at_path (object_nodes.item.rm_type_name, yyvs2.item (yyvsp2))
					if rm_prop_def.is_container then
						create yyval18.make_multiple (rm_attribute_name, yyvs13.item (yyvsp13), yyvs14.item (yyvsp14))
						yyval18.set_differential_path (parent_path_str)
						c_attrs.put (yyval18)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + yyvs2.item (yyvsp2) + "; container = " + yyval18.is_multiple.out) 
	if attached yyvs13.item (yyvsp13) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	if attached yyvs14.item (yyvsp14) as att_card then io.put_string ("; cardinality=(" + att_card.as_string + ")") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval18)

					elseif not attached yyvs14.item (yyvsp14) then
						create yyval18.make_single (rm_attribute_name, yyvs13.item (yyvsp13))
						yyval18.set_differential_path (parent_path_str)
						c_attrs.put (yyval18)
debug ("ADL_parse")
	io.put_string (indent + "PUSH create ATTR_NODE " + yyvs2.item (yyvsp2) + "; container = " + yyval18.is_multiple.out) 
	if attached yyvs13.item (yyvsp13) as att_ex then io.put_string (" existence={" + att_ex.as_string + "}") end
	io.new_line
	io.put_string (indent + "OBJECT_NODE " + object_nodes.item.rm_type_name + " [id=" + object_nodes.item.node_id + "] put_attribute (REL)%N") 
	indent.append ("%T")
end
						object_nodes.item.put_attribute (yyval18)
					else -- error - cardinality stated, but on a non-container attribute
						abort_with_error (ec_VSAM2, <<yyvs2.item (yyvsp2)>>)
					end
				else
					abort_with_error (ec_VDIFP2, <<yyvs2.item (yyvsp2)>>)
				end
			else
				abort_with_error (ec_VCATU, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp13 := yyvsp13 -1
	yyvsp14 := yyvsp14 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 56 then
--|#line 698 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 698")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 57 then
--|#line 701 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 701")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 58 then
--|#line 704 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 704")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 59 then
--|#line 709 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 709")
end

			-- add the tuple's C_ATTRIBUTEs to the current object node's children
			across c_attr_tuple.members as c_attrs_csr loop
				if not object_nodes.item.has_attribute (c_attrs_csr.item.rm_attribute_name) then
					object_nodes.item.put_attribute (c_attrs_csr.item)
				else
					abort_with_error (ec_VCATU, <<c_attrs_csr.item.rm_attribute_name>>)
				end
			end

			-- add the tuple to the current object node
			object_nodes.item.put_attribute_tuple (c_attr_tuple)

			c_attr_tuple_count := 0

			debug ("ADL_parse")
				indent.remove_tail (1)
				io.put_string (indent + "C_ATTR_TUPLE (complete)%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 60 then
--|#line 732 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 732")
end

			create c_attr_tuple.make
			c_attr_tuple.put_member (create {C_ATTRIBUTE}.make_single (yyvs2.item (yyvsp2), Void))
			debug ("ADL_parse")
				io.put_string (indent + "enter C_ATTR_TUPLE%N") 
				indent.append ("%T")
				io.put_string (indent + "add C_ATTR_TUPLE id " + yyvs2.item (yyvsp2) + "%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 61 then
--|#line 742 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 742")
end

			c_attr_tuple.put_member (create {C_ATTRIBUTE}.make_single (yyvs2.item (yyvsp2), Void))
			debug ("ADL_parse")
				io.put_string (indent + "add C_ATTR_TUPLE id " + yyvs2.item (yyvsp2) + "%N") 
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 62 then
--|#line 751 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 751")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 63 then
--|#line 754 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 754")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 64 then
--|#line 759 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 759")
end

			debug ("ADL_parse")
				io.put_string (indent + "c_attr_tuple_value - received one tuple %N") 
			end
			c_attr_tuple_count := c_attr_tuple_count + 1
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 65 then
--|#line 768 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 768")
end

			c_attr_tuple_item := 1
			if c_attr_tuple_count = 0 then
				c_attr_tuple.i_th_member (c_attr_tuple_item).put_child (yyvs16.item (yyvsp16))
			elseif attached {C_PRIMITIVE_OBJECT} c_attr_tuple.i_th_member (c_attr_tuple_item).children.first as cpo then
				cpo.merge_tuple (yyvs16.item (yyvsp16))
			end
			debug ("ADL_parse")
				io.put_string (indent + "c_tuple values - add C_PRIMITIVE_OBJECT " + c_attr_tuple.i_th_member (1).rm_attribute_name + " %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp16 := yyvsp16 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 66 then
--|#line 780 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 780")
end

			c_attr_tuple_item := c_attr_tuple_item + 1
			if c_attr_tuple_count = 0 then
				c_attr_tuple.i_th_member (c_attr_tuple_item).put_child (yyvs16.item (yyvsp16))
			elseif attached {C_PRIMITIVE_OBJECT} c_attr_tuple.i_th_member (c_attr_tuple_item).children.first as cpo then
				cpo.merge_tuple (yyvs16.item (yyvsp16))
			end
			debug ("ADL_parse")
				io.put_string (indent + "c_tuple values - add other C_PRIMITIVE_OBJECT " + c_attr_tuple.i_th_member (c_attr_tuple_item).rm_attribute_name + " %N")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp16 := yyvsp16 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 67 then
--|#line 794 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 794")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp6 := yyvsp6 + 1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 68 then
--|#line 795 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 795")
end

			debug ("include list")
				io.put_string (indent + "[---assertion expression---] %N")
			end
			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 69 then
--|#line 804 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 804")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp6 := yyvsp6 + 1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 70 then
--|#line 805 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 805")
end

			debug ("exclude list")
				io.put_string (indent + "[---assertion expression---] %N")
			end
			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 71 then
--|#line 818 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 818")
end

			create yyval6.make (0)
			yyval6.extend (yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 72 then
--|#line 823 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 823")
end

			yyvs6.item (yyvsp6).extend (yyvs7.item (yyvsp7))
			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp7 := yyvsp7 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 73 then
--|#line 830 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 830")
end

			create yyval7.make (yyvs19.item (yyvsp19), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 74 then
--|#line 834 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 834")
end

			create yyval7.make (yyvs19.item (yyvsp19), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp19 := yyvsp19 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 75 then
--|#line 842 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 842")
end

			create yyval7.make (yyvs21.item (yyvsp21), Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 76 then
--|#line 846 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 846")
end

			abort_with_error (ec_SINVS, <<yyvs2.item (yyvsp2)>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 77 then
--|#line 854 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 854")
end

			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 78 then
--|#line 858 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 858")
end

			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 79 then
--|#line 864 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 864")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_expr: REDUCE from boolean_unop_expr: [" + yyvs20.item (yyvsp20).as_string + "]%N") 
			end
			yyval19 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 80 then
--|#line 871 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 871")
end

			yyval19 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 81 then
--|#line 877 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 877")
end

			yyval19 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 82 then
--|#line 881 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 881")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_leaf: REDUCE from boolean_constraint: [" + yyvs21.item (yyvsp21).as_string + "]%N") 
			end
			yyval19 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 83 then
--|#line 888 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 888")
end

			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 84 then
--|#line 892 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 892")
end

			yyval19 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 85 then
--|#line 902 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 902")
end

			debug ("ADL_rule")
				io.put_string (indent + "arch_outer_constraint_expr: Archetype outer feature " + yyvs2.item (yyvsp2) + " matches {" + yyvs16.item (yyvsp16).as_string + "}%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (op_matches),
				create {EXPR_LEAF}.make_archetype_ref (yyvs2.item (yyvsp2)),
				create {EXPR_LEAF}.make_constraint (yyvs16.item (yyvsp16)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
	yyvsp16 := yyvsp16 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 86 then
--|#line 913 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 913")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_constraint:" + yyvs2.item (yyvsp2) + " matches {" + yyvs16.item (yyvsp16).as_string + "}%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)),
				create {EXPR_LEAF}.make_constraint (yyvs16.item (yyvsp16)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
	yyvsp16 := yyvsp16 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 87 then
--|#line 922 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 922")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_constraint:" + yyvs2.item (yyvsp2) + " matches {" + yyvs57.item (yyvsp57).as_string + "}%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (op_matches), 
				create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)),
				create {EXPR_LEAF}.make_coded_term (yyvs57.item (yyvsp57)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -3
	yyvsp57 := yyvsp57 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 88 then
--|#line 937 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 937")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_unop_expr: exists " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (op_exists), create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 89 then
--|#line 944 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 944")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_unop_expr: not " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (op_not), create {EXPR_LEAF}.make_archetype_definition_ref (yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 90 then
--|#line 951 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 951")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_unop_expr: not [(" + yyvs19.item (yyvsp19).as_string + ")] %N") 
			end
			create yyval20.make (create {OPERATOR_KIND}.make (op_not), yyvs19.item (yyvsp19))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp20 := yyvsp20 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp19 := yyvsp19 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 91 then
--|#line 958 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 958")
end

			abort_with_error (ec_SEXPT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 92 then
--|#line 968 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 968")
end

			debug ("ADL_rule")
				io.put_string (indent + "boolean_binop_expr: [" + yyvs19.item (yyvsp19 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs19.item (yyvsp19).as_string + "]%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))), yyvs19.item (yyvsp19 - 1), yyvs19.item (yyvsp19))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp19 := yyvsp19 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 93 then
--|#line 977 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 977")
end

			yyval2 := operator_symbol (op_or)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 94 then
--|#line 981 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 981")
end

			yyval2 := operator_symbol (op_and)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 95 then
--|#line 985 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 985")
end

			yyval2 := operator_symbol (op_xor)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 96 then
--|#line 989 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 989")
end

			yyval2 := operator_symbol (op_implies)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 97 then
--|#line 999 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 999")
end

			create yyval22.make_boolean (True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 98 then
--|#line 1003 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1003")
end

			create yyval22.make_boolean (False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 99 then
--|#line 1013 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1013")
end

			debug ("ADL_rule")
				io.put_string (indent + "arithmetic_relop_expr: [" + yyvs19.item (yyvsp19 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs19.item (yyvsp19).as_string + "]%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))), yyvs19.item (yyvsp19 - 1), yyvs19.item (yyvsp19))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp19 := yyvsp19 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 100 then
--|#line 1026 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1026")
end

			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 101 then
--|#line 1030 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1030")
end

			yyval19 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 102 then
--|#line 1036 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1036")
end

			yyval19 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp19 := yyvsp19 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 103 then
--|#line 1040 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1040")
end

			debug ("ADL_rule")
				io.put_string (indent + "(expr) %N") 
			end
			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 104 then
--|#line 1053 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1053")
end

			debug ("ADL_rule")
				io.put_string (indent + "arithmetic_arith_binop_expr: [" + yyvs19.item (yyvsp19 - 1).as_string + "] " + yyvs2.item (yyvsp2) + " [" + yyvs19.item (yyvsp19).as_string + "]%N") 
			end
			create yyval21.make (create {OPERATOR_KIND}.make (operator_ids_from_symbols.item (yyvs2.item (yyvsp2))), yyvs19.item (yyvsp19 - 1), yyvs19.item (yyvsp19))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp19 := yyvsp19 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 105 then
--|#line 1066 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1066")
end

			debug ("ADL_rule")
				io.put_string (indent + "arith_leaf - integer: " + yyvs3.item (yyvsp3).out + "%N") 
			end
			create yyval22.make_integer (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 106 then
--|#line 1073 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1073")
end

			debug ("ADL_rule")
				io.put_string (indent + "arith_leaf - real: " + yyvs4.item (yyvsp4).out + "%N") 
			end
			create yyval22.make_real (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 107 then
--|#line 1080 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1080")
end

			debug ("ADL_rule")
				io.put_string (indent + "arith_leaf - path: " + yyvs2.item (yyvsp2) + "%N") 
			end
			create yyval22.make_archetype_definition_ref (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 108 then
--|#line 1089 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1089")
end

			yyval2 := operator_symbol (op_eq)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 109 then
--|#line 1093 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1093")
end

			yyval2 := operator_symbol (op_ne)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 110 then
--|#line 1097 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1097")
end

			yyval2 := operator_symbol (op_le)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 111 then
--|#line 1101 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1101")
end

			yyval2 := operator_symbol (op_lt)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 112 then
--|#line 1105 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1105")
end

			yyval2 := operator_symbol (op_ge)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 113 then
--|#line 1109 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1109")
end

			yyval2 := operator_symbol (op_gt)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 114 then
--|#line 1115 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1115")
end

			yyval2 := operator_symbol (op_divide)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 115 then
--|#line 1119 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1119")
end

			yyval2 := operator_symbol (op_multiply)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 116 then
--|#line 1123 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1123")
end

			yyval2 := operator_symbol (op_plus)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 117 then
--|#line 1127 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1127")
end

			yyval2 := operator_symbol (op_minus)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 118 then
--|#line 1131 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1131")
end

			yyval2 := operator_symbol (op_exp)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 119 then
--|#line 1140 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1140")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp13 := yyvsp13 + 1
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 120 then
--|#line 1141 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1141")
end

			yyval13 := yyvs11.item (yyvsp11)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp11 := yyvsp11 -1
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 121 then
--|#line 1147 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1147")
end

			if yyvs3.item (yyvsp3) = 0 then
				create yyval11.make_prohibited
			elseif yyvs3.item (yyvsp3) = 1 then
				create yyval11.make_mandatory
			else
				abort_with_error (ec_SEXLSG, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 122 then
--|#line 1157 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1157")
end

			if yyvs3.item (yyvsp3 - 1) = 0 then
				if yyvs3.item (yyvsp3) = 0 then
					create yyval11.make_point (0)
				elseif yyvs3.item (yyvsp3) = 1 then
					create yyval11.make_bounded (0, 1)
				else
					abort_with_error (ec_SEXLU1, Void)
				end
			elseif yyvs3.item (yyvsp3 - 1) = 1 then
				if yyvs3.item (yyvsp3) = 1 then
					create yyval11.make_point (1)
				else
					abort_with_error (ec_SEXLU2, Void)
				end
			else
				abort_with_error (ec_SEXLMG, Void)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp11 := yyvsp11 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 123 then
--|#line 1179 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1179")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp14 := yyvsp14 + 1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 124 then
--|#line 1180 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1180")
end

			yyval14 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp14 := yyvsp14 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp12 := yyvsp12 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 125 then
--|#line 1186 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1186")
end

			create yyval12.make (yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp11 := yyvsp11 -1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 126 then
--|#line 1190 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1190")
end

			create yyval12.make (yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 127 then
--|#line 1194 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1194")
end

			create yyval12.make (yyvs11.item (yyvsp11))
			yyval12.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 128 then
--|#line 1199 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1199")
end

			create yyval12.make (yyvs11.item (yyvsp11))
			yyval12.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp12 := yyvsp12 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 129 then
--|#line 1204 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1204")
end

			create yyval12.make (yyvs11.item (yyvsp11))
			yyval12.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp12 := yyvsp12 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 130 then
--|#line 1209 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1209")
end

			create yyval12.make (yyvs11.item (yyvsp11))
			yyval12.set_unique
			yyval12.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp12 := yyvsp12 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 131 then
--|#line 1215 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1215")
end

			create yyval12.make (yyvs11.item (yyvsp11))
			yyval12.set_unique
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp12 := yyvsp12 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 132 then
--|#line 1220 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1220")
end

			create yyval12.make (yyvs11.item (yyvsp11))
			yyval12.set_unique
			yyval12.set_unordered
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp12 := yyvsp12 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -4
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 133 then
--|#line 1228 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1228")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp13 := yyvsp13 + 1
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 134 then
--|#line 1229 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1229")
end

			yyval13 := yyvs11.item (yyvsp11)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp11 := yyvsp11 -1
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 135 then
--|#line 1233 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1233")
end

			abort_with_error (ec_SOCCF, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 136 then
--|#line 1239 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1239")
end

			create yyval11.make_point (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 137 then
--|#line 1243 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1243")
end

			create yyval11.make_upper_unbounded (0)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 138 then
--|#line 1247 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1247")
end

			create yyval11.make_bounded (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp11 := yyvsp11 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 139 then
--|#line 1251 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1251")
end

			create yyval11.make_upper_unbounded (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp11 := yyvsp11 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 140 then
--|#line 1259 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1259")
end

			create yyval56.make_simple (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 141 then
--|#line 1263 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1263")
end

			create yyval56.make_list_simple (yyvs30.item (yyvsp30))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp30 := yyvsp30 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 142 then
--|#line 1267 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1267")
end

			create yyval56.make_interval (yyvs37.item (yyvsp37))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp37 := yyvsp37 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 143 then
--|#line 1271 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1271")
end

			create yyval56.make_list (yyvs43.item (yyvsp43))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp56 := yyvsp56 + 1
	yyvsp43 := yyvsp43 -1
	if yyvsp56 >= yyvsc56 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs56")
		end
		yyvsc56 := yyvsc56 + yyInitial_yyvs_size
		yyvs56 := yyspecial_routines56.aliased_resized_area (yyvs56, yyvsc56)
	end
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 144 then
--|#line 1275 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1275")
end

			if yyvs56.item (yyvsp56).valid_value (yyvs3.item (yyvsp3)) then
				yyvs56.item (yyvsp56).set_assumed_value (yyvs3.item (yyvsp3))
				yyval56 := yyvs56.item (yyvsp56)
			else
				abort_with_error (ec_VOBAV, <<yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 145 then
--|#line 1284 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1284")
end

			abort_with_error (ec_SCIAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines56.force (yyvs56, yyval56, yyvsp56)
end
when 146 then
--|#line 1290 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1290")
end

			create yyval55.make_simple (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 147 then
--|#line 1294 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1294")
end

			create yyval55.make_list_simple (yyvs31.item (yyvsp31))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp31 := yyvsp31 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 148 then
--|#line 1298 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1298")
end

			create yyval55.make_interval (yyvs38.item (yyvsp38))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp38 := yyvsp38 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 149 then
--|#line 1302 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1302")
end

			create yyval55.make_list (yyvs44.item (yyvsp44))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp55 := yyvsp55 + 1
	yyvsp44 := yyvsp44 -1
	if yyvsp55 >= yyvsc55 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs55")
		end
		yyvsc55 := yyvsc55 + yyInitial_yyvs_size
		yyvs55 := yyspecial_routines55.aliased_resized_area (yyvs55, yyvsc55)
	end
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 150 then
--|#line 1306 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1306")
end

			if yyvs55.item (yyvsp55).valid_value (yyvs4.item (yyvsp4)) then
				yyvs55.item (yyvsp55).set_assumed_value (yyvs4.item (yyvsp4))
				yyval55 := yyvs55.item (yyvsp55)
			else
				abort_with_error (ec_VOBAV, <<yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 151 then
--|#line 1315 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1315")
end

			abort_with_error (ec_SCRAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines55.force (yyvs55, yyval55, yyvsp55)
end
when 152 then
--|#line 1321 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1321")
end

			if valid_iso8601_date_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval53.make_from_pattern (yyvs2.item (yyvsp2))
			else
				create str.make (0)
				from valid_date_constraint_patterns.start until valid_date_constraint_patterns.off loop
					if not valid_date_constraint_patterns.isfirst then
						str.append (", ")
					end
					str.append (valid_date_constraint_patterns.item)
					valid_date_constraint_patterns.forth
				end
				abort_with_error (ec_SCDPT, <<yyvs2.item (yyvsp2), str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 153 then
--|#line 1337 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1337")
end

			create yyval53.make_simple (yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp24 := yyvsp24 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 154 then
--|#line 1341 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1341")
end

			create yyval53.make_list_simple (yyvs33.item (yyvsp33))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp33 := yyvsp33 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 155 then
--|#line 1345 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1345")
end

			create yyval53.make_interval (yyvs40.item (yyvsp40))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp40 := yyvsp40 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 156 then
--|#line 1349 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1349")
end

			create yyval53.make_list (yyvs46.item (yyvsp46))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp53 := yyvsp53 + 1
	yyvsp46 := yyvsp46 -1
	if yyvsp53 >= yyvsc53 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs53")
		end
		yyvsc53 := yyvsc53 + yyInitial_yyvs_size
		yyvs53 := yyspecial_routines53.aliased_resized_area (yyvs53, yyvsc53)
	end
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 157 then
--|#line 1353 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1353")
end

			if yyvs53.item (yyvsp53).valid_value (yyvs24.item (yyvsp24)) then
				yyvs53.item (yyvsp53).set_assumed_value (yyvs24.item (yyvsp24))
				yyval53 := yyvs53.item (yyvsp53)
			else
				abort_with_error (ec_VOBAV, <<yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp24 := yyvsp24 -1
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 158 then
--|#line 1362 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1362")
end

			abort_with_error (ec_SCDAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines53.force (yyvs53, yyval53, yyvsp53)
end
when 159 then
--|#line 1368 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1368")
end

			if valid_iso8601_time_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval54.make_from_pattern (yyvs2.item (yyvsp2))
			else
				create str.make (0)
				across valid_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append (", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error (ec_SCTPT, <<yyvs2.item (yyvsp2), str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 160 then
--|#line 1383 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1383")
end

			create yyval54.make_simple (yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp26 := yyvsp26 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 161 then
--|#line 1387 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1387")
end

			create yyval54.make_list_simple (yyvs34.item (yyvsp34))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp34 := yyvsp34 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 162 then
--|#line 1391 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1391")
end

			create yyval54.make_interval (yyvs39.item (yyvsp39))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp39 := yyvsp39 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 163 then
--|#line 1395 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1395")
end

			create yyval54.make_list (yyvs45.item (yyvsp45))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp54 := yyvsp54 + 1
	yyvsp45 := yyvsp45 -1
	if yyvsp54 >= yyvsc54 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs54")
		end
		yyvsc54 := yyvsc54 + yyInitial_yyvs_size
		yyvs54 := yyspecial_routines54.aliased_resized_area (yyvs54, yyvsc54)
	end
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 164 then
--|#line 1399 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1399")
end

			if yyvs54.item (yyvsp54).valid_value (yyvs26.item (yyvsp26)) then
				yyvs54.item (yyvsp54).set_assumed_value (yyvs26.item (yyvsp26))
				yyval54 := yyvs54.item (yyvsp54)
			else
				abort_with_error (ec_VOBAV, <<yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 165 then
--|#line 1408 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1408")
end

			abort_with_error (ec_SCTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines54.force (yyvs54, yyval54, yyvsp54)
end
when 166 then
--|#line 1414 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1414")
end

			if valid_iso8601_date_time_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval51.make_from_pattern (yyvs2.item (yyvsp2))
			else
				create str.make (0)
				across valid_date_time_constraint_patterns as patterns_csr loop
					if patterns_csr.cursor_index > 1 then
						str.append (", ")
					end
					str.append (patterns_csr.item)
				end
				abort_with_error (ec_SCDTPT, <<yyvs2.item (yyvsp2), str>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 167 then
--|#line 1429 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1429")
end

			create yyval51.make_simple (yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp25 := yyvsp25 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 168 then
--|#line 1433 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1433")
end

			create yyval51.make_list_simple (yyvs35.item (yyvsp35))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 169 then
--|#line 1437 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1437")
end

			create yyval51.make_interval (yyvs41.item (yyvsp41))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp41 := yyvsp41 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 170 then
--|#line 1441 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1441")
end

			create yyval51.make_list (yyvs47.item (yyvsp47))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp51 := yyvsp51 + 1
	yyvsp47 := yyvsp47 -1
	if yyvsp51 >= yyvsc51 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs51")
		end
		yyvsc51 := yyvsc51 + yyInitial_yyvs_size
		yyvs51 := yyspecial_routines51.aliased_resized_area (yyvs51, yyvsc51)
	end
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 171 then
--|#line 1445 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1445")
end

			if yyvs51.item (yyvsp51).valid_value (yyvs25.item (yyvsp25)) then
				yyvs51.item (yyvsp51).set_assumed_value (yyvs25.item (yyvsp25))
				yyval51 := yyvs51.item (yyvsp51)
			else
				abort_with_error (ec_VOBAV, <<yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp25 := yyvsp25 -1
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 172 then
--|#line 1454 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1454")
end

			abort_with_error (ec_SCDTAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines51.force (yyvs51, yyval51, yyvsp51)
end
when 173 then
--|#line 1460 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1460")
end

			if valid_iso8601_duration_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval52.make_pattern_with_range (yyvs2.item (yyvsp2), yyvs42.item (yyvsp42))
			else
				abort_with_error (ec_SCDUPT, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyvsp42 := yyvsp42 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 174 then
--|#line 1468 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1468")
end

			if valid_iso8601_duration_constraint_pattern (yyvs2.item (yyvsp2)) then
				create yyval52.make_from_pattern (yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_SCDUPT, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 175 then
--|#line 1476 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1476")
end

			create yyval52.make_simple (yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp27 := yyvsp27 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 176 then
--|#line 1480 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1480")
end

			create yyval52.make_list_simple (yyvs36.item (yyvsp36))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp36 := yyvsp36 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 177 then
--|#line 1484 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1484")
end

			create yyval52.make_interval (yyvs42.item (yyvsp42))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp42 := yyvsp42 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 178 then
--|#line 1488 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1488")
end

			create yyval52.make_list (yyvs48.item (yyvsp48))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp48 := yyvsp48 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 179 then
--|#line 1492 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1492")
end

			if yyvs52.item (yyvsp52).valid_value (yyvs27.item (yyvsp27)) then
				yyvs52.item (yyvsp52).set_assumed_value (yyvs27.item (yyvsp27))
				yyval52 := yyvs52.item (yyvsp52)
			else
				abort_with_error (ec_VOBAV, <<yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 180 then
--|#line 1501 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1501")
end

			abort_with_error (ec_SCDUAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 181 then
--|#line 1506 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1506")
end

			abort_with_error (ec_SCDUPT, <<yyvs2.item (yyvsp2).out>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp52 := yyvsp52 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp52 >= yyvsc52 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs52")
		end
		yyvsc52 := yyvsc52 + yyInitial_yyvs_size
		yyvs52 := yyspecial_routines52.aliased_resized_area (yyvs52, yyvsc52)
	end
	yyspecial_routines52.force (yyvs52, yyval52, yyvsp52)
end
when 182 then
--|#line 1512 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1512")
end

			create yyval50.make_simple (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp50 := yyvsp50 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 183 then
--|#line 1516 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1516")
end

			create yyval50.make_list (yyvs29.item (yyvsp29))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp50 := yyvsp50 + 1
	yyvsp29 := yyvsp29 -1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 184 then
--|#line 1520 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1520")
end

			create yyval50.make_from_regexp (yyvs2.item (yyvsp2).substring (2, yyvs2.item (yyvsp2).count - 1), yyvs2.item (yyvsp2).item (1) = '/')
			if yyval50.regexp.is_equal ({C_STRING}.Invalid_regex_message) then
				abort_with_error (ec_SCSRE, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp50 := yyvsp50 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp50 >= yyvsc50 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs50")
		end
		yyvsc50 := yyvsc50 + yyInitial_yyvs_size
		yyvs50 := yyspecial_routines50.aliased_resized_area (yyvs50, yyvsc50)
	end
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 185 then
--|#line 1527 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1527")
end

			if yyvs50.item (yyvsp50).valid_value (yyvs2.item (yyvsp2)) then
				yyvs50.item (yyvsp50).set_assumed_value (yyvs2.item (yyvsp2))
				yyval50 := yyvs50.item (yyvsp50)
			else
				abort_with_error (ec_VOBAV, <<yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 186 then
--|#line 1536 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1536")
end

			abort_with_error (ec_SCSAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines50.force (yyvs50, yyval50, yyvsp50)
end
when 187 then
--|#line 1542 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1542")
end

			if is_adl_14_term_code_constraint (yyvs2.item (yyvsp2)) then
				yyvs2.item (yyvsp2) := adl_14_code_constraint_reformatted (yyvs2.item (yyvsp2))
			end
			if constraint_model_factory.valid_c_terminology_code_string (yyvs2.item (yyvsp2)) then
				yyval57 := constraint_model_factory.create_c_terminology_code (yyvs2.item (yyvsp2))
			else
				abort_with_errors (constraint_model_factory.errors)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 188 then
--|#line 1553 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1553")
end

			if constraint_model_factory.valid_c_terminology_code_string (yyvs2.item (yyvsp2)) then
				yyval57 := constraint_model_factory.create_c_terminology_code (yyvs2.item (yyvsp2))
			else
				abort_with_errors (constraint_model_factory.errors)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp57 := yyvsp57 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp57 >= yyvsc57 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs57")
		end
		yyvsc57 := yyvsc57 + yyInitial_yyvs_size
		yyvs57 := yyspecial_routines57.aliased_resized_area (yyvs57, yyvsc57)
	end
	yyspecial_routines57.force (yyvs57, yyval57, yyvsp57)
end
when 189 then
--|#line 1563 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1563")
end

			create yyval49.make_true
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp49 := yyvsp49 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 190 then
--|#line 1567 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1567")
end

			create yyval49.make_false
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp49 := yyvsp49 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 191 then
--|#line 1571 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1571")
end

			create yyval49.make_list (yyvs32.item (yyvsp32))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp49 := yyvsp49 + 1
	yyvsp32 := yyvsp32 -1
	if yyvsp49 >= yyvsc49 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs49")
		end
		yyvsc49 := yyvsc49 + yyInitial_yyvs_size
		yyvs49 := yyspecial_routines49.aliased_resized_area (yyvs49, yyvsc49)
	end
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 192 then
--|#line 1575 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1575")
end

			if yyvs49.item (yyvsp49).valid_value (yyvs23.item (yyvsp23)) then
				yyvs49.item (yyvsp49).set_assumed_value (yyvs23.item (yyvsp23))
			else
				abort_with_error (ec_VOBAV, <<yyvs23.item (yyvsp23).out>>)
			end
			yyval49 := yyvs49.item (yyvsp49)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp23 := yyvsp23 -1
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 193 then
--|#line 1584 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1584")
end

			abort_with_error (ec_SCBAV, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines49.force (yyvs49, yyval49, yyvsp49)
end
when 194 then
--|#line 1590 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1590")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 195 then
--|#line 1594 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1594")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 196 then
--|#line 1600 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1600")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 197 then
--|#line 1604 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1604")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 198 then
--|#line 1617 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1617")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 199 then
--|#line 1623 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1623")
end

			create yyval29.make(0)
			yyval29.extend(yyvs2.item (yyvsp2 - 1))
			yyval29.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp29 := yyvsp29 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 200 then
--|#line 1629 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1629")
end

			yyvs29.item (yyvsp29).extend(yyvs2.item (yyvsp2))
			yyval29 := yyvs29.item (yyvsp29)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 201 then
--|#line 1637 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1637")
end

			yyval29 := yyvs29.item (yyvsp29)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 202 then
--|#line 1641 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1641")
end

			create yyval29.make (0)
			yyval29.extend (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp29 := yyvsp29 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 203 then
--|#line 1648 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1648")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 204 then
--|#line 1652 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1652")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 205 then
--|#line 1656 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1656")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 206 then
--|#line 1662 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1662")
end

			create yyval30.make(0)
			yyval30.extend(yyvs3.item (yyvsp3 - 1))
			yyval30.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 207 then
--|#line 1668 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1668")
end

			yyvs30.item (yyvsp30).extend(yyvs3.item (yyvsp3))
			yyval30 := yyvs30.item (yyvsp30)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 208 then
--|#line 1673 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1673")
end

			create yyval30.make(0)
			yyval30.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 209 then
--|#line 1680 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1680")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [INTEGER]} yyval37.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 210 then
--|#line 1688 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1688")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [INTEGER]} yyval37.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 211 then
--|#line 1696 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1696")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [INTEGER]} yyval37.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 212 then
--|#line 1704 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1704")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [INTEGER]} yyval37.make_bounded (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp3 := yyvsp3 -2
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 213 then
--|#line 1712 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1712")
end

			create {PROPER_INTERVAL [INTEGER]} yyval37.make_lower_unbounded (yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 214 then
--|#line 1716 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1716")
end

			create {PROPER_INTERVAL [INTEGER]} yyval37.make_lower_unbounded (yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 215 then
--|#line 1720 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1720")
end

			create {PROPER_INTERVAL [INTEGER]} yyval37.make_upper_unbounded (yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 216 then
--|#line 1724 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1724")
end

			create {PROPER_INTERVAL [INTEGER]} yyval37.make_upper_unbounded (yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 217 then
--|#line 1728 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1728")
end

			create {POINT_INTERVAL [INTEGER]} yyval37.make (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp37 := yyvsp37 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 218 then
--|#line 1734 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1734")
end

			create yyval43.make(0)
			yyval43.extend(yyvs37.item (yyvsp37 - 1))
			yyval43.extend(yyvs37.item (yyvsp37))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp43 := yyvsp43 + 1
	yyvsp37 := yyvsp37 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 219 then
--|#line 1740 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1740")
end

			yyvs43.item (yyvsp43).extend(yyvs37.item (yyvsp37))
			yyval43 := yyvs43.item (yyvsp43)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp37 := yyvsp37 -1
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 220 then
--|#line 1745 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1745")
end

			create yyval43.make(0)
			yyval43.extend(yyvs37.item (yyvsp37))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp43 := yyvsp43 + 1
	yyvsp37 := yyvsp37 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 221 then
--|#line 1752 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1752")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 222 then
--|#line 1756 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1756")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 223 then
--|#line 1760 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1760")
end

			yyval4 := - yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 224 then
--|#line 1766 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1766")
end

			create yyval31.make(0)
			yyval31.extend(yyvs4.item (yyvsp4 - 1))
			yyval31.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp4 := yyvsp4 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 225 then
--|#line 1772 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1772")
end

			yyvs31.item (yyvsp31).extend(yyvs4.item (yyvsp4))
			yyval31 := yyvs31.item (yyvsp31)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 226 then
--|#line 1777 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1777")
end

			create yyval31.make(0)
			yyval31.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 227 then
--|#line 1784 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1784")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create {PROPER_INTERVAL [REAL]} yyval38.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 228 then
--|#line 1792 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1792")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create {PROPER_INTERVAL [REAL]} yyval38.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp4 := yyvsp4 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 229 then
--|#line 1800 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1800")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create {PROPER_INTERVAL [REAL]} yyval38.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp4 := yyvsp4 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 230 then
--|#line 1808 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1808")
end

			if yyvs4.item (yyvsp4 - 1) <= yyvs4.item (yyvsp4) then
				create {PROPER_INTERVAL [REAL]} yyval38.make_bounded(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs4.item (yyvsp4 - 1).out, yyvs4.item (yyvsp4).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp4 := yyvsp4 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 231 then
--|#line 1816 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1816")
end

			create {PROPER_INTERVAL [REAL]} yyval38.make_lower_unbounded(yyvs4.item (yyvsp4), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 232 then
--|#line 1820 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1820")
end

			create {PROPER_INTERVAL [REAL]} yyval38.make_lower_unbounded(yyvs4.item (yyvsp4), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 233 then
--|#line 1824 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1824")
end

			create {PROPER_INTERVAL [REAL]} yyval38.make_upper_unbounded(yyvs4.item (yyvsp4), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 234 then
--|#line 1828 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1828")
end

			create {PROPER_INTERVAL [REAL]} yyval38.make_upper_unbounded(yyvs4.item (yyvsp4), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 235 then
--|#line 1832 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1832")
end

			create {POINT_INTERVAL [REAL]} yyval38.make(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp38 := yyvsp38 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp4 := yyvsp4 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 236 then
--|#line 1838 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1838")
end

			create yyval44.make(0)
			yyval44.extend(yyvs38.item (yyvsp38 - 1))
			yyval44.extend(yyvs38.item (yyvsp38))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp44 := yyvsp44 + 1
	yyvsp38 := yyvsp38 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 237 then
--|#line 1844 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1844")
end

			yyvs44.item (yyvsp44).extend(yyvs38.item (yyvsp38))
			yyval44 := yyvs44.item (yyvsp44)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp38 := yyvsp38 -1
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 238 then
--|#line 1849 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1849")
end

			create yyval44.make(0)
			yyval44.extend(yyvs38.item (yyvsp38))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp44 := yyvsp44 + 1
	yyvsp38 := yyvsp38 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp44 >= yyvsc44 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs44")
		end
		yyvsc44 := yyvsc44 + yyInitial_yyvs_size
		yyvs44 := yyspecial_routines44.aliased_resized_area (yyvs44, yyvsc44)
	end
	yyspecial_routines44.force (yyvs44, yyval44, yyvsp44)
end
when 239 then
--|#line 1856 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1856")
end

			yyval23 := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp23 := yyvsp23 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp23 >= yyvsc23 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs23")
		end
		yyvsc23 := yyvsc23 + yyInitial_yyvs_size
		yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
	end
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 240 then
--|#line 1860 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1860")
end

			yyval23 := False
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp23 := yyvsp23 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp23 >= yyvsc23 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs23")
		end
		yyvsc23 := yyvsc23 + yyInitial_yyvs_size
		yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
	end
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 241 then
--|#line 1866 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1866")
end

			create yyval32.make(0)
			yyval32.extend(yyvs23.item (yyvsp23 - 1))
			yyval32.extend(yyvs23.item (yyvsp23))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp23 := yyvsp23 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 242 then
--|#line 1872 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1872")
end

			yyvs32.item (yyvsp32).extend(yyvs23.item (yyvsp23))
			yyval32 := yyvs32.item (yyvsp32)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp23 := yyvsp23 -1
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 243 then
--|#line 1877 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1877")
end

			create yyval32.make(0)
			yyval32.extend(yyvs23.item (yyvsp23))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp23 := yyvsp23 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 244 then
--|#line 1884 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1884")
end

			if valid_iso8601_date(yyvs2.item (yyvsp2)) then
				create yyval24.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VIDV, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp24 := yyvsp24 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp24 >= yyvsc24 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs24")
		end
		yyvsc24 := yyvsc24 + yyInitial_yyvs_size
		yyvs24 := yyspecial_routines24.aliased_resized_area (yyvs24, yyvsc24)
	end
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 245 then
--|#line 1894 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1894")
end

			create yyval33.make(0)
			yyval33.extend (yyvs24.item (yyvsp24 - 1))
			yyval33.extend (yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp24 := yyvsp24 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 246 then
--|#line 1900 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1900")
end

			yyvs33.item (yyvsp33).extend (yyvs24.item (yyvsp24))
			yyval33 := yyvs33.item (yyvsp33)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp24 := yyvsp24 -1
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 247 then
--|#line 1905 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1905")
end

			create yyval33.make(0)
			yyval33.extend (yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp24 := yyvsp24 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 248 then
--|#line 1912 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1912")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval40.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 249 then
--|#line 1920 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1920")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval40.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp24 := yyvsp24 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 250 then
--|#line 1928 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1928")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval40.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp24 := yyvsp24 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 251 then
--|#line 1936 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1936")
end

			if yyvs24.item (yyvsp24 - 1) <= yyvs24.item (yyvsp24) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval40.make_bounded(yyvs24.item (yyvsp24 - 1), yyvs24.item (yyvsp24), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs24.item (yyvsp24 - 1).out, yyvs24.item (yyvsp24).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp24 := yyvsp24 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 252 then
--|#line 1944 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1944")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval40.make_lower_unbounded(yyvs24.item (yyvsp24), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 253 then
--|#line 1948 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1948")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval40.make_lower_unbounded(yyvs24.item (yyvsp24), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 254 then
--|#line 1952 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1952")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval40.make_upper_unbounded(yyvs24.item (yyvsp24), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 255 then
--|#line 1956 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1956")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval40.make_upper_unbounded(yyvs24.item (yyvsp24), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp24 := yyvsp24 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 256 then
--|#line 1960 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1960")
end

			create {POINT_INTERVAL [ISO8601_DATE]} yyval40.make (yyvs24.item (yyvsp24))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp40 := yyvsp40 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp24 := yyvsp24 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 257 then
--|#line 1966 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1966")
end

			create yyval46.make(0)
			yyval46.extend(yyvs40.item (yyvsp40 - 1))
			yyval46.extend(yyvs40.item (yyvsp40))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp46 := yyvsp46 + 1
	yyvsp40 := yyvsp40 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp46 >= yyvsc46 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs46")
		end
		yyvsc46 := yyvsc46 + yyInitial_yyvs_size
		yyvs46 := yyspecial_routines46.aliased_resized_area (yyvs46, yyvsc46)
	end
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
when 258 then
--|#line 1972 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1972")
end

			yyvs46.item (yyvsp46).extend(yyvs40.item (yyvsp40))
			yyval46 := yyvs46.item (yyvsp46)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp40 := yyvsp40 -1
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
when 259 then
--|#line 1977 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1977")
end

			create yyval46.make(0)
			yyval46.extend(yyvs40.item (yyvsp40))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp46 := yyvsp46 + 1
	yyvsp40 := yyvsp40 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp46 >= yyvsc46 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs46")
		end
		yyvsc46 := yyvsc46 + yyInitial_yyvs_size
		yyvs46 := yyspecial_routines46.aliased_resized_area (yyvs46, yyvsc46)
	end
	yyspecial_routines46.force (yyvs46, yyval46, yyvsp46)
end
when 260 then
--|#line 1984 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1984")
end

			if valid_iso8601_time(yyvs2.item (yyvsp2)) then
				create yyval26.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VITV, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp26 := yyvsp26 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
when 261 then
--|#line 1994 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 1994")
end

			create yyval34.make(0)
			yyval34.extend(yyvs26.item (yyvsp26 - 1))
			yyval34.extend(yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 + 1
	yyvsp26 := yyvsp26 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 262 then
--|#line 2000 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2000")
end

			yyvs34.item (yyvsp34).extend(yyvs26.item (yyvsp26))
			yyval34 := yyvs34.item (yyvsp34)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp26 := yyvsp26 -1
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 263 then
--|#line 2005 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2005")
end

			create yyval34.make(0)
			yyval34.extend(yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 + 1
	yyvsp26 := yyvsp26 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 264 then
--|#line 2012 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2012")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval39.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 265 then
--|#line 2020 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2020")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval39.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp26 := yyvsp26 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 266 then
--|#line 2028 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2028")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval39.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp26 := yyvsp26 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 267 then
--|#line 2036 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2036")
end

			if yyvs26.item (yyvsp26 - 1) <= yyvs26.item (yyvsp26) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval39.make_bounded(yyvs26.item (yyvsp26 - 1), yyvs26.item (yyvsp26), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs26.item (yyvsp26 - 1).out, yyvs26.item (yyvsp26).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp26 := yyvsp26 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 268 then
--|#line 2044 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2044")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval39.make_lower_unbounded(yyvs26.item (yyvsp26), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 269 then
--|#line 2048 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2048")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval39.make_lower_unbounded(yyvs26.item (yyvsp26), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 270 then
--|#line 2052 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2052")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval39.make_upper_unbounded(yyvs26.item (yyvsp26), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 271 then
--|#line 2056 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2056")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval39.make_upper_unbounded(yyvs26.item (yyvsp26), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp26 := yyvsp26 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 272 then
--|#line 2060 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2060")
end

			create {POINT_INTERVAL [ISO8601_TIME]} yyval39.make (yyvs26.item (yyvsp26))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp39 := yyvsp39 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp26 := yyvsp26 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 273 then
--|#line 2066 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2066")
end

			create yyval45.make(0)
			yyval45.extend(yyvs39.item (yyvsp39 - 1))
			yyval45.extend(yyvs39.item (yyvsp39))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp45 := yyvsp45 + 1
	yyvsp39 := yyvsp39 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 274 then
--|#line 2072 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2072")
end

			yyvs45.item (yyvsp45).extend(yyvs39.item (yyvsp39))
			yyval45 := yyvs45.item (yyvsp45)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp39 := yyvsp39 -1
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 275 then
--|#line 2077 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2077")
end

			create yyval45.make(0)
			yyval45.extend(yyvs39.item (yyvsp39))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp45 := yyvsp45 + 1
	yyvsp39 := yyvsp39 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp45 >= yyvsc45 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs45")
		end
		yyvsc45 := yyvsc45 + yyInitial_yyvs_size
		yyvs45 := yyspecial_routines45.aliased_resized_area (yyvs45, yyvsc45)
	end
	yyspecial_routines45.force (yyvs45, yyval45, yyvsp45)
end
when 276 then
--|#line 2084 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2084")
end

			if valid_iso8601_date_time(yyvs2.item (yyvsp2)) then
				create yyval25.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VIDTV, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp25 := yyvsp25 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp25 >= yyvsc25 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs25")
		end
		yyvsc25 := yyvsc25 + yyInitial_yyvs_size
		yyvs25 := yyspecial_routines25.aliased_resized_area (yyvs25, yyvsc25)
	end
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 277 then
--|#line 2094 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2094")
end

			create yyval35.make(0)
			yyval35.extend(yyvs25.item (yyvsp25 - 1))
			yyval35.extend(yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp35 := yyvsp35 + 1
	yyvsp25 := yyvsp25 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 278 then
--|#line 2100 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2100")
end

			yyvs35.item (yyvsp35).extend(yyvs25.item (yyvsp25))
			yyval35 := yyvs35.item (yyvsp35)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp25 := yyvsp25 -1
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 279 then
--|#line 2105 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2105")
end

			create yyval35.make(0)
			yyval35.extend(yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp35 := yyvsp35 + 1
	yyvsp25 := yyvsp25 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 280 then
--|#line 2112 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2112")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval41.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 281 then
--|#line 2120 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2120")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval41.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp25 := yyvsp25 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 282 then
--|#line 2128 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2128")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval41.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp25 := yyvsp25 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 283 then
--|#line 2136 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2136")
end

			if yyvs25.item (yyvsp25 - 1) <= yyvs25.item (yyvsp25) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval41.make_bounded(yyvs25.item (yyvsp25 - 1), yyvs25.item (yyvsp25), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs25.item (yyvsp25 - 1).out, yyvs25.item (yyvsp25).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp25 := yyvsp25 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 284 then
--|#line 2144 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2144")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval41.make_lower_unbounded(yyvs25.item (yyvsp25), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 285 then
--|#line 2148 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2148")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval41.make_lower_unbounded(yyvs25.item (yyvsp25), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 286 then
--|#line 2152 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2152")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval41.make_upper_unbounded(yyvs25.item (yyvsp25), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 287 then
--|#line 2156 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2156")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval41.make_upper_unbounded(yyvs25.item (yyvsp25), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp25 := yyvsp25 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 288 then
--|#line 2160 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2160")
end

			create {POINT_INTERVAL [ISO8601_DATE_TIME]} yyval41.make (yyvs25.item (yyvsp25))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp41 := yyvsp41 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp25 := yyvsp25 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 289 then
--|#line 2166 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2166")
end

			create yyval47.make(0)
			yyval47.extend(yyvs41.item (yyvsp41 - 1))
			yyval47.extend(yyvs41.item (yyvsp41))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp47 := yyvsp47 + 1
	yyvsp41 := yyvsp41 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp47 >= yyvsc47 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs47")
		end
		yyvsc47 := yyvsc47 + yyInitial_yyvs_size
		yyvs47 := yyspecial_routines47.aliased_resized_area (yyvs47, yyvsc47)
	end
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
when 290 then
--|#line 2172 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2172")
end

			yyvs47.item (yyvsp47).extend(yyvs41.item (yyvsp41))
			yyval47 := yyvs47.item (yyvsp47)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp41 := yyvsp41 -1
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
when 291 then
--|#line 2177 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2177")
end

			create yyval47.make(0)
			yyval47.extend(yyvs41.item (yyvsp41))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp47 := yyvsp47 + 1
	yyvsp41 := yyvsp41 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp47 >= yyvsc47 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs47")
		end
		yyvsc47 := yyvsc47 + yyInitial_yyvs_size
		yyvs47 := yyspecial_routines47.aliased_resized_area (yyvs47, yyvsc47)
	end
	yyspecial_routines47.force (yyvs47, yyval47, yyvsp47)
end
when 292 then
--|#line 2184 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2184")
end

			if valid_iso8601_duration(yyvs2.item (yyvsp2)) then
				create yyval27.make_from_string(yyvs2.item (yyvsp2))
			else
				abort_with_error (ec_VIDUV, <<yyvs2.item (yyvsp2)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp27 := yyvsp27 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp27 >= yyvsc27 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs27")
		end
		yyvsc27 := yyvsc27 + yyInitial_yyvs_size
		yyvs27 := yyspecial_routines27.aliased_resized_area (yyvs27, yyvsc27)
	end
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
when 293 then
--|#line 2194 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2194")
end

			create yyval36.make(0)
			yyval36.extend(yyvs27.item (yyvsp27 - 1))
			yyval36.extend(yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp27 := yyvsp27 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 294 then
--|#line 2200 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2200")
end

			yyvs36.item (yyvsp36).extend(yyvs27.item (yyvsp27))
			yyval36 := yyvs36.item (yyvsp36)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp27 := yyvsp27 -1
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 295 then
--|#line 2205 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2205")
end

			create yyval36.make(0)
			yyval36.extend(yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp36 := yyvsp36 + 1
	yyvsp27 := yyvsp27 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 296 then
--|#line 2212 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2212")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval42.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 297 then
--|#line 2220 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2220")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval42.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp27 := yyvsp27 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 298 then
--|#line 2228 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2228")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval42.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp27 := yyvsp27 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 299 then
--|#line 2236 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2236")
end

			if yyvs27.item (yyvsp27 - 1) <= yyvs27.item (yyvsp27) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval42.make_bounded(yyvs27.item (yyvsp27 - 1), yyvs27.item (yyvsp27), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs27.item (yyvsp27 - 1).out, yyvs27.item (yyvsp27).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp27 := yyvsp27 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 300 then
--|#line 2244 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2244")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval42.make_lower_unbounded(yyvs27.item (yyvsp27), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 301 then
--|#line 2248 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2248")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval42.make_lower_unbounded(yyvs27.item (yyvsp27), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 302 then
--|#line 2252 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2252")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval42.make_upper_unbounded(yyvs27.item (yyvsp27), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 303 then
--|#line 2256 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2256")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval42.make_upper_unbounded(yyvs27.item (yyvsp27), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp27 := yyvsp27 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 304 then
--|#line 2260 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2260")
end

			create {POINT_INTERVAL [ISO8601_DURATION]} yyval42.make (yyvs27.item (yyvsp27))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp42 := yyvsp42 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp27 := yyvsp27 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 305 then
--|#line 2266 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2266")
end

			create yyval48.make(0)
			yyval48.extend(yyvs42.item (yyvsp42 - 1))
			yyval48.extend(yyvs42.item (yyvsp42))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp48 := yyvsp48 + 1
	yyvsp42 := yyvsp42 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp48 >= yyvsc48 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs48")
		end
		yyvsc48 := yyvsc48 + yyInitial_yyvs_size
		yyvs48 := yyspecial_routines48.aliased_resized_area (yyvs48, yyvsc48)
	end
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
when 306 then
--|#line 2272 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2272")
end

			yyvs48.item (yyvsp48).extend(yyvs42.item (yyvsp42))
			yyval48 := yyvs48.item (yyvsp48)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp42 := yyvsp42 -1
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
when 307 then
--|#line 2277 "cadl_15_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'cadl_15_parser.y' at line 2277")
end

			create yyval48.make(0)
			yyval48.extend(yyvs42.item (yyvsp42))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp48 := yyvsp48 + 1
	yyvsp42 := yyvsp42 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp48 >= yyvsc48 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs48")
		end
		yyvsc48 := yyvsc48 + yyInitial_yyvs_size
		yyvs48 := yyspecial_routines48.aliased_resized_area (yyvs48, yyvsc48)
	end
	yyspecial_routines48.force (yyvs48, yyval48, yyvsp48)
end
				else
					debug ("GEYACC")
						std.error.put_string ("Error in parser: unknown rule id: ")
						std.error.put_integer (yy_act)
						std.error.put_new_line
					end
					abort
				end
			end
		rescue
			if yy_parsing_status = yyAborted then
				yy_retried := True
				retry
			end
		end

	yy_do_error_action (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			when 558 then
					-- End-of-file expected action.
				report_eof_expected_error
			else
					-- Default action.
				report_error ("parse error")
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: SPECIAL [INTEGER]
			-- Template for `yytranslate'
		once
			Result := yyfixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   86,   87,   76,   74,   84,   75,    2,   77,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   85,   88,
			    2,   68,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   82,    2,   83,   81,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   14,
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,

			   45,   46,   47,   48,   49,   50,   51,   52,   53,   54,
			   55,   56,   57,   58,   59,   60,   61,   62,   63,   64,
			   65,   66,   67,   69,   70,   71,   72,   73,   78,   79,
			   80, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,  164,  164,  164,  165,  165,  104,  103,  103,  103,
			  103,   96,   96,  166,  166,  166,  169,  169,  169,  169,
			  169,  169,   93,   93,   93,   94,   94,  170,  170,  108,
			  108,  107,  106,  106,  106,  106,  106,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  167,  168,  168,  171,
			  171,  172,  172,  172,  109,  109,  174,  174,  174,  173,
			  175,  175,  176,  176,  177,  178,  178,   90,   90,   91,
			   91,   89,   89,   92,   92,   92,   92,  110,  110,  111,
			  111,  112,  112,  112,  112,  118,  119,  119,  114,  114,
			  114,  114,  115,  154,  154,  154,  154,  121,  121,  116,

			  122,  122,  113,  113,  117,  120,  120,  120,  153,  153,
			  153,  153,  153,  153,  152,  152,  152,  152,  152,  101,
			  101,   98,   98,  102,  102,   99,   99,   99,   99,   99,
			   99,   99,   99,  100,  100,  100,   97,   97,   97,   97,
			  162,  162,  162,  162,  162,  162,  161,  161,  161,  161,
			  161,  161,  159,  159,  159,  159,  159,  159,  159,  160,
			  160,  160,  160,  160,  160,  160,  157,  157,  157,  157,
			  157,  157,  157,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  156,  156,  156,  156,  156,  163,  163,  155,
			  155,  155,  155,  155,  130,  130,   95,   95,  131,  132,

			  132,  132,  132,  123,  123,  123,  133,  133,  133,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  146,  146,
			  146,  124,  124,  124,  134,  134,  134,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  147,  147,  147,  125,
			  125,  135,  135,  135,  126,  136,  136,  136,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  149,  149,  149,
			  128,  137,  137,  137,  142,  142,  142,  142,  142,  142,
			  142,  142,  142,  148,  148,  148,  127,  138,  138,  138,
			  144,  144,  144,  144,  144,  144,  144,  144,  144,  150,
			  150,  150,  129,  139,  139,  139,  145,  145,  145,  145,

			  145,  145,  145,  145,  145,  151,  151,  151, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    2,    2,    2,    2,    4,    3,    1,    6,    7,
			    2,   10,   15,   15,   19,   19,   19,   19,   20,   21,
			   21,   21,   21,   21,   22,   22,   19,    3,    4,    2,
			    1,   19,   19,    4,    3,    4,    3,    1,    2,    2,
			    1,    2,    2,    1,    1,    7,    2,    2,    2,    2,
			    1,   13,    1,    1,    1,    1,    1,    2,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    2,    1,    1,    1,   19,    1,    1,    2,    1,    1,
			    1,   19,    1,    2,   19,   19,    1,   19,    1,    1,

			    1,    1,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,   16,    3,    4,   23,   24,
			   25,   26,   27,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,
			   46,   47,   48,   49,   50,   51,   52,   53,   54,   55,
			   56,   57,   16,   57,    1,    1,    1,    2,    2,    1,
			   18,    1,    1,    1,    1,    1,    1,   19,    1,    1,
			    1,    1,    3,    4,   24,   25,   26,   27,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    3,   11,    3,    2,    1,    1,   13,   13,    1,
			    1,    1,    3,    4,   24,   25,   26,   27,    3,    4,
			   24,   25,   26,   27,    3,    4,   24,   25,   26,   27,
			    3,    4,   24,   25,   26,   27,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,   42,
			    1,    2,    1,    3,    1,    1,    1,    4,    1,    1,
			    1,   23,    1,   24,    1,   25,    1,   26,    1,   27,
			    1,    2,    3,    4,   23,   24,   26,   25,   27,    1,

			    1,   37,    1,    1,   38,    1,    1,   39,    1,    1,
			   40,    1,    1,   41,    1,   42,   37,   38,   39,   40,
			   41,   42,    1,   23,    2,    1,    2,    1,   25,    1,
			   27,    1,   24,    1,   26,    1,    4,    1,    3,    1,
			    1,    1,    1,    1,    1,   14,   14,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
			    1,    4,    1,   24,    1,   25,    1,   26,    1,   27,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    3,    2,    1,    1,    1,
			    1,    1,    1,    1,    8,    9,    2,   10,   16,   17,
			   17,   17,    1,    1,    1,    1,    1,    1,    3,    1,
			    4,    1,   24,    1,   25,    1,   26,    1,   27,    3,
			    1,    4,    1,   24,    1,   25,    1,   26,    1,   27,
			    1,    1,    3,   11,    1,    2,    1,    2,    2,    1,
			    1,   13,    1,   13,    1,    1,    1,    3,    1,    4,
			    1,   24,    1,   25,    1,   26,    1,   27,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			   11,   12,    2,    1,    2,    1,    1,    2,    1,    2,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    3,    1,    1,    1,    2,    2,    2,    1,    6,   16,
			    1,    1,    1,    1,    1,    1,    1,    1,    6,    1,
			    6,    1,    1,    1,    1,    1,    2,   13,    6,    1,
			   16,    1,    1,    1,    1,    1,    1,   13,    1,    1,
			    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    5,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,   98,   97,
			    0,  107,  195,  197,  196,  221,  203,    3,    2,   71,
			  194,    0,  133,    5,   74,   78,   77,  100,   79,   80,
			   84,  101,   75,   82,  102,   81,    0,  105,  106,    0,
			    1,    0,    0,  223,  205,  222,  204,    0,   89,   88,
			   91,   12,   11,    0,    0,   72,  194,    8,    7,    0,
			    0,    6,    0,   94,   95,   93,   96,    0,  118,  114,
			  115,  117,  116,  112,  110,  113,  111,  109,  108,    0,
			    0,    0,   83,  103,    0,    0,    0,   10,    0,  135,
			    0,   92,    0,  107,  104,   99,   76,   73,   90,  240,

			  239,    0,  181,  174,  152,  159,  166,  292,  276,  260,
			  244,  184,  187,  188,  182,    0,  140,  146,    0,  153,
			  167,  160,  175,  183,  141,  147,  191,  154,  161,  168,
			  176,  142,  148,  162,  155,  169,  177,  143,  149,  163,
			  156,  170,  178,   45,   43,   41,   42,   39,   40,   38,
			   37,   44,    0,    0,    0,    0,   46,  119,  119,   15,
			   52,    0,   13,   14,   47,   49,   50,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   85,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   86,   87,  137,    0,
			    0,  203,    0,  136,   60,    0,    0,  123,  123,    0,
			    4,   48,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  217,    0,  235,
			    0,  256,    0,  288,    0,  272,    0,  304,    0,  173,
			  202,  199,  208,  206,    0,    0,  226,  224,  243,  240,
			  239,  241,  247,  245,  279,  277,  263,  261,  295,  293,
			  201,  200,  207,  225,  242,  246,  262,  278,  294,  220,

			    0,  218,  238,    0,  236,  275,    0,  273,  259,    0,
			  257,  291,    0,  289,  307,  305,  219,  237,  274,  258,
			  290,  306,  193,  192,  198,  186,  185,  172,  171,  180,
			  179,  158,  157,  165,  164,  151,  150,  145,  144,    0,
			  134,    0,    0,    0,    0,   55,   54,    0,  216,  234,
			  255,  287,  271,  303,  214,  232,  253,  285,  269,  301,
			    0,  215,    0,  233,    0,  254,    0,  286,    0,  270,
			    0,  302,  213,  231,  252,  284,  268,  300,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  139,  138,   61,    0,    0,    0,
			    0,    0,    0,   21,   17,   18,    9,    0,   20,  133,
			   30,   19,   16,   58,   56,  133,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  209,    0,  227,    0,  248,    0,  280,    0,  264,    0,
			  296,    0,  121,    0,    0,    0,   36,   35,    0,   53,
			    0,   31,    0,    0,   51,   21,   57,    0,  210,    0,
			  228,    0,  249,    0,  281,    0,  265,    0,  297,  211,
			  229,  250,  282,  266,  298,    0,    0,   62,    0,  120,

			  125,    0,   27,   26,   32,    0,   24,    0,   67,   25,
			  212,  230,  251,  283,  267,  299,    0,    0,    0,   59,
			  122,    0,  124,   34,    0,    0,   33,    0,   69,    0,
			    0,   64,   63,  128,  126,  127,    0,  133,   68,    0,
			    0,   65,    0,    0,    0,    0,    0,   22,   70,   29,
			    0,  131,  132,  129,  130,  133,   66,   23,    0,    0,
			    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   18,  528,  540,   19,  424,  425,   56,  427,  222,  463,
			  501,   61,  227,  345,   22,   23,  428,  429,  430,  431,
			  160,   24,   25,   26,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   38,  118,  119,  120,  121,
			  122,   39,  326,  123,  124,  125,  126,  127,  128,  129,
			  130,  131,  132,  133,  134,  135,  136,  137,  138,  139,
			  140,  141,  142,   79,   80,   67,  143,  144,  145,  146,
			  147,  148,  149,  150,  151,  558,  432,  161,  162,  163,
			  434,  435,  164,  165,  166,  436,  225,  496,  497,  517, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  153,  173,  630,  624,  -12,  193,  782,  780, -32768, -32768,
			  771,  769, -32768, -32768, -32768, -32768, -32768, -32768,    8, -32768,
			  572,  451,   -9,  766,  552, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  432, -32768, -32768,  764,
			 -32768,  347,  375, -32768, -32768, -32768, -32768,  173, -32768, -32768,
			 -32768, -32768, -32768,  775,  773, -32768, -32768, -32768, -32768,  774,
			  136, -32768,  765, -32768, -32768, -32768, -32768,  217, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   42,
			   42,  196, -32768, -32768,  272,  723,  723, -32768,  762, -32768,
			   20, -32768,   42, -32768, -32768,  589, -32768,  552, -32768,  517,

			  462,  327, -32768,  703, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  760,  759,  758,  757,  756,  755,
			  754,  753,  752,  751,  750,  749,  748,  747,  744,  743,
			  741,  733,  731,  730,  725,  724,  719,  718,  717,  716,
			  715,  711,  706,  701,  700,  699,  697,  696,  695,  694,
			  693, -32768,  746,  745,   65,  767, -32768,  740,  740, -32768,
			  729,  742, -32768,   31, -32768, -32768, -32768,  481,  219,  219,
			  219,  219,  529,  514,  483,  480,  448,  436,  734,   24,
			 -32768,  180,  301,  380,  170,  233,  237,  205,   22,  121,
			  200,  588,  645,  622,  634,  616,  349,  344,  333,  322,

			  263,  216,  739,  738,  737,  736,  735,  734,  201,  430,
			   29,  174,  130,   32,   60,   55, -32768, -32768, -32768,  763,
			  761,  721,  732, -32768, -32768,  255,  675,  722,  722,  712,
			 -32768, -32768,  728,  727,  726,  720,  710,  708,  707,  704,
			  702,  698,  692,  691,  420,  391,  385,  384,    6,    3,
			  690,  689,  687,  686,  685,  684,  111, -32768,  198, -32768,
			   30, -32768,   -4, -32768,   95, -32768,  123, -32768,  321, -32768,
			 -32768, -32768, -32768, -32768,  709,  676, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			  215, -32768, -32768,  299, -32768, -32768,  257, -32768, -32768,  245,
			 -32768, -32768,  316, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   68,
			 -32768,  688,  665,  663,  652, -32768, -32768,  626, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			   76, -32768,  159, -32768,   14, -32768,  -13, -32768,   44, -32768,
			   37, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  121,  659,
			  200,  658,  645,  656,  634,  655,  622,  650,  616,  649,
			  616,  616,  616,  616,  121,  121,  121,  121,  200,  200,

			  200,  200,  622,  622,  622,  622,  645,  645,  645,  645,
			  634,  634,  634,  634, -32768, -32768, -32768,  647,  673,  642,
			  451,  574,  451,  640, -32768, -32768,  606,  149, -32768,   -9,
			  621, -32768, -32768, -32768, -32768,   -9,  681,  121,  637,  200,
			  635,  645,  625,  634,  623,  622,  610,  616,  605,  604,
			 -32768,  603, -32768,  569, -32768,  559, -32768,  556, -32768,  553,
			 -32768,  275,  540,  532,   65,  402, -32768,  557,   23, -32768,
			  451, -32768,  530,  520, -32768, -32768, -32768,  485, -32768,  465,
			 -32768,  461, -32768,  441, -32768,  439, -32768,  426, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  424,   -3, -32768,  449, -32768,

			  353,  381, -32768, -32768,  377,  414, -32768,  372,  331, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  723,  129,  275, -32768,
			 -32768,  567, -32768, -32768,  293,  277, -32768,    8,  258,  273,
			  250, -32768, -32768,  253,  188,  161,  242,   -9,    8,    8,
			   88, -32768,  723,  282,  222,  135,   66, -32768,    8, -32768,
			   10, -32768, -32768, -32768, -32768,   -9, -32768, -32768,   50,   45,
			 -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -115, -32768, -32768,  -18, -32768, -32768,    1,  822,  357, -32768,
			 -32768, -410,  662,  591, -32768, -32768,  -81, -32768, -32768, -32768,
			 -32768,   16, -32768,  776,  772, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,    9,  -83,  -78,  -21,   -2,  -47,  -60,
			  -92, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  358,  332,  328,  278,  274, -143, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  768, -32768,  812, -32768,  464, -32768,
			  374, -32768,  644, -32768, -32768, -32768, -32768, -32768,  287, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   55,   20,  116,  116,  115,  152,   48,  117,  117,  177,
			   42,  108,   16,   15,   14,   13,   12,   41,  172,  471,
			  108,  159,   59,  173,  506,  473,   11,   10,  158,  519,
			  327,   60,  291,  333,  271,  269,  110,  371,  157,  158,
			  369,  176,  556,    9,    8,  560,   16,   15,  370,  157,
			  559,  368,  110,  108,  175,  109,  337,  443,  315,   16,
			   93,  335,  107,   84,  321,   15,  384,  109,  290,  221,
			  270,  223,   16,    5,   47,    4,  237,  243,  249,  255,
			   16,  518,    3,    2,  441,  232,  238,  244,  250,   95,
			  233,  239,  245,  251,    1,  289,  156,   97,  273,  174,

			  382,  167,  155,  298,  277,  505,  292,  447,  236,  242,
			  248,  254,  293,  155,  445,   16,    3,    2,  109,  330,
			  549,  235,  241,  247,  253,   16,  287,  547,   92,  220,
			  219,  331,  338,  296,  275,  274,  336,   89,  285,  220,
			  219,  218,  220,  219,  414,  557,  437,  297,  107,  555,
			  220,  219,  110,  334,   17,   14,   13,   16,   15,   14,
			   13,   12,  281,  328,   15,  386,  234,  240,  246,  252,
			  294,   11,   10,  379,  389,  329,  177,   16,   15,  554,
			  381,  378,  283,   88,   16,  220,  219,  323,    9,    8,
			  295,   11,  110,  388,   50,  220,  219,   96,  470,  107,

			   16,   15,  322,   15,  387,   15,    7,    6,    9,    8,
			  332,   49,  531,  530,   11,  385,  282,  172,    5,   16,
			    4,   16,   15,   16,   15,  173,  272,    3,    2,  439,
			  107,    9,    8,  275,  274,   11,  280,  279,    5,    1,
			    4,  110,  109,  108,  107,  546,  176,    3,    2,  545,
			  268,  288,    9,    8,  220,  219,  415,  108,  383,    1,
			  109,    5,  314,    4,  116,  175,  553,  110,  380,  117,
			    3,    2,  275,  274,  275,  274,  544,  438,  448,  284,
			  109,  542,    1,  286,  440,  397,  396,  395,  394,  220,
			  219,    3,    2,    3,    2,  449,  459,  312,  237,  243,

			  249,  255,  451,    1,   15,  541,   15,  174,  446,  311,
			  539,  232,  238,  244,  250,  409,  408,  407,  406,  444,
			  233,  239,  245,  251,  552,  551,  457,  405,  404,  403,
			  402,   16,   15,   66,   65,   64,   63,  455,  342,  341,
			  108,  543,  236,  242,  248,  254,  107,  276,  426,  110,
			  109,  108,  107,  116,  477,  487,  309,  495,  117,   98,
			  537,  479,  442,  235,  241,  247,  253,  306,  308,  401,
			  400,  399,  398,  275,  274,  275,  274,  536,  303,  305,
			  453,  223,  527,  300,  526,  485,  413,  412,  411,  410,
			  302,  393,  392,  391,  390,  299,  483,  171,  170,  169,

			  168,    3,    2,  503,  234,  240,  246,  252,   66,   65,
			   64,   63,  538,  522,  502,  280,  279,  525,  367,  365,
			  -28,  465,  467,  468,  548,  363,  278,  524,   59,  366,
			  364,  325,  523,  116,   82,  529,  362,  426,  117,  481,
			  324,  521,  -28,   78,   77,   76,   75,   74,   73,   72,
			   71,   70,   69,  520,  361,  516,   68,   14,   13,  116,
			  515,  550,   83, -189,  117,  360, -189, -189, -189, -189,
			  267,  507, -189,  514,  313,  513, -189,  310, -189, -189,
			  320,  266,  265,  319, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189,  264, -189,  512, -189, -189, -189,  511,

			   78,   77,   76,   75,   74,   73,   72,   71,   70,   69,
			 -189, -189, -189,   68,  263, -189, -189,  261, -190,  510,
			   55, -190, -190, -190, -190,  262,  307, -190,  260,  304,
			   55, -190,  318, -190, -190,  317, -189, -189,  509, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190,  259, -190,
			 -189, -190, -190, -190,  301,   72,   71,   70,   69,  258,
			  316,  508,   68,  257,  499, -190, -190, -190,   83,  504,
			 -190, -190,   -9,   -9,  256,  466,   -9,   -9,   -9,   -9,
			   14,   13,   -9,   58,   57,  498,   -9,  494,   -9,   -9,
			  493, -190, -190,  492,   -9,   -9,   -9,   -9,   -9,   -9,

			   -9,   -9,   -9,  491,   -9, -190,   -9,   -9,   -9,  535,
			  534,  533,   -9,   66,   65,   64,   63,   58,   57,   -9,
			   -9,   -9,   -9,  280,  279,   -9,   -9,  423,   46,   45,
			   16,   15,   14,   13,   44,   43,  114,  490,  489,  488,
			  113,  107,  112,  111,  486,  109,   -9,   -9,  110,  109,
			  108,  107,  106,  105,  104,  103,  102,  484,  108,  482,
			  101,  100,   99,   72,   71,   70,   69,  110,  472,  480,
			   68,  478,  469,  464,  422,  421,  420,  462,  461,    7,
			    6,   45,  475,  460,  458,   16,   15,   14,   13,  456,
			  454,  114,  452,  450,  418,  113,  416,  112,  111,  419,

			    3,    2,  156,  110,  109,  108,  107,  106,  105,  104,
			  103,  102,  417,  474,   43,  101,  100,   99,  377,  376,
			  375,  374,  343,  373,  372,  359,  358,   16,   15,  422,
			  421,  420,  357,  114,    7,    6,  356,  113,  355,  112,
			  111,  354,  353,  347,  352,  110,  109,  108,  107,  106,
			  105,  104,  103,  102,  351,    3,    2,  101,  100,   99,
			  350,  349,  348,  344,  340,   46,  339,   44,  268,  312,
			  309,  306,  303,  300,  230,  224,  229,  217,  216,  226,
			  178,  215,  214,  213,  212,  211,   87,  210,  209,  208,
			  207,  180,   52,  154,   51,  206,   90,    3,    2,  205,

			  204,  203,  202,  201,   86,  532,   85,  231,  200,  199,
			  476,  433,   40,   62,  198,  197,   54,  196,   53,  346,
			  228,  500,   21,    0,    0,  195,    0,  194,  193,    0,
			    0,  192,  191,  190,  189,  188,  187,  186,  185,  184,
			  183,  182,  181,   91,  179,    0,    0,    0,    0,   81,
			    0,   94,    0,    0,  153, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   18,    0,   85,   86,   85,   86,   18,   85,   86,  101,
			    1,   24,    4,    5,    6,    7,    8,    1,  101,  429,
			   24,    1,   21,  101,    1,  435,   18,   19,    8,   32,
			    1,   40,   10,    1,   10,  178,   22,   34,   18,    8,
			   34,  101,   32,   35,   36,    0,    4,    5,   45,   18,
			    0,   45,   22,   24,  101,   23,    1,   70,  201,    4,
			   18,    1,   25,   47,  207,    5,   70,   23,   46,    4,
			   46,  154,    4,   65,   86,   67,  168,  169,  170,  171,
			    4,   84,   74,   75,   70,  168,  169,  170,  171,   80,
			  168,  169,  170,  171,   86,  187,   76,   81,  181,  101,

			   70,   92,   82,  195,  182,   82,  189,   70,  168,  169,
			  170,  171,  190,   82,   70,    4,   74,   75,   23,  211,
			   32,  168,  169,  170,  171,    4,  186,  537,   86,   74,
			   75,    1,  215,  193,   74,   75,  214,    1,  185,   74,
			   75,   76,   74,   75,   76,  555,   70,  194,   25,   83,
			   74,   75,   22,  213,    1,    6,    7,    4,    5,    6,
			    7,    8,  183,  210,    5,   70,  168,  169,  170,  171,
			  191,   18,   19,  256,  266,    1,  268,    4,    5,   44,
			  258,   70,  184,   47,    4,   74,   75,  208,   35,   36,
			  192,   18,   22,   70,    1,   74,   75,    1,   49,   25,

			    4,    5,    1,    5,  264,    5,   53,   54,   35,   36,
			  212,   18,   83,   84,   18,  262,   46,  300,   65,    4,
			   67,    4,    5,    4,    5,  303,   46,   74,   75,   70,
			   25,   35,   36,   74,   75,   18,   35,   36,   65,   86,
			   67,   22,   23,   24,   25,    3,  306,   74,   75,   88,
			   34,   46,   35,   36,   74,   75,  339,   24,  260,   86,
			   23,   65,   46,   67,  347,  312,   44,   22,   70,  347,
			   74,   75,   74,   75,   74,   75,   88,  360,  370,   46,
			   23,   31,   86,   46,  362,   70,   71,   72,   73,   74,
			   75,   74,   75,   74,   75,  378,  388,   34,  390,  391,

			  392,  393,  380,   86,    5,   32,    5,  309,  368,   46,
			   52,  394,  395,  396,  397,   70,   71,   72,   73,  366,
			  398,  399,  400,  401,   42,   43,  386,   70,   71,   72,
			   73,    4,    5,   61,   62,   63,   64,  384,   83,   84,
			   24,   88,  402,  403,  404,  405,   25,   46,  347,   22,
			   23,   24,   25,  436,  437,  447,   34,   82,  436,   87,
			   83,  439,  364,  410,  411,  412,  413,   34,   46,   70,
			   71,   72,   73,   74,   75,   74,   75,   84,   34,   46,
			  382,  464,   51,   34,   12,  445,   70,   71,   72,   73,
			   46,   70,   71,   72,   73,   46,  443,   70,   71,   72,

			   73,   74,   75,    1,  406,  407,  408,  409,   61,   62,
			   63,   64,  527,   32,   12,   35,   36,    3,   34,   34,
			   18,  420,  421,  422,  539,   34,   46,   13,  427,   45,
			   45,    1,   55,  516,   87,  516,   45,  436,  516,  441,
			   10,   88,   40,   68,   69,   70,   71,   72,   73,   74,
			   75,   76,   77,    4,   34,   31,   81,    6,    7,  542,
			   34,  542,   87,    1,  542,   45,    4,    5,    6,    7,
			   34,  470,   10,   34,  200,   34,   14,  199,   16,   17,
			  206,   45,   34,  205,   22,   23,   24,   25,   26,   27,
			   28,   29,   30,   45,   32,   34,   34,   35,   36,   34,

			   68,   69,   70,   71,   72,   73,   74,   75,   76,   77,
			   48,   49,   50,   81,   34,   53,   54,   34,    1,   34,
			  538,    4,    5,    6,    7,   45,  198,   10,   45,  197,
			  548,   14,  204,   16,   17,  203,   74,   75,   18,   22,
			   23,   24,   25,   26,   27,   28,   29,   30,   34,   32,
			   88,   34,   35,   36,  196,   74,   75,   76,   77,   45,
			  202,   31,   81,   34,   32,   48,   49,   50,   87,   12,
			   53,   54,    0,    1,   45,    1,    4,    5,    6,    7,
			    6,    7,   10,   11,   12,   45,   14,   34,   16,   17,
			   34,   74,   75,   34,   22,   23,   24,   25,   26,   27,

			   28,   29,   30,   34,   32,   88,   34,   35,   36,   42,
			   43,   44,   40,   61,   62,   63,   64,   11,   12,   47,
			   48,   49,   50,   35,   36,   53,   54,    1,    4,    5,
			    4,    5,    6,    7,    4,    5,   10,   34,   34,   34,
			   14,   25,   16,   17,   34,   23,   74,   75,   22,   23,
			   24,   25,   26,   27,   28,   29,   30,   34,   24,   34,
			   34,   35,   36,   74,   75,   76,   77,   22,   47,   34,
			   81,   34,   32,   31,   48,   49,   50,    4,   31,   53,
			   54,    5,    1,   34,   34,    4,    5,    6,    7,   34,
			   34,   10,   34,   34,   31,   14,    8,   16,   17,   47,

			   74,   75,   76,   22,   23,   24,   25,   26,   27,   28,
			   29,   30,   47,   32,    5,   34,   35,   36,   34,   34,
			   34,   34,   47,   34,   34,   34,   34,    4,    5,   48,
			   49,   50,   34,   10,   53,   54,   34,   14,   34,   16,
			   17,   34,   34,   31,   34,   22,   23,   24,   25,   26,
			   27,   28,   29,   30,   34,   74,   75,   34,   35,   36,
			   34,   34,   34,   41,   32,    4,   45,    4,   34,   34,
			   34,   34,   34,   34,   32,    8,   47,   32,   32,   39,
			   77,   88,   88,   88,   88,   88,   12,   88,   88,   88,
			   84,   32,   12,   31,   12,   84,   31,   74,   75,   84,

			   84,   84,   84,   84,   31,  518,   31,  163,   84,   84,
			  436,  347,    0,   47,   84,   84,   47,   84,   47,  228,
			  158,  464,    0,   -1,   -1,   84,   -1,   84,   84,   -1,
			   -1,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   67,   84,   -1,   -1,   -1,   -1,   85,
			   -1,   79,   -1,   -1,   86, yyDummy>>)
		end

feature {NONE} -- Semantic value stacks

	yyvs1: SPECIAL [detachable ANY]
			-- Stack for semantic values of type detachable ANY

	yyvsc1: INTEGER
			-- Capacity of semantic value stack `yyvs1'

	yyvsp1: INTEGER
			-- Top of semantic value stack `yyvs1'

	yyspecial_routines1: KL_SPECIAL_ROUTINES [detachable ANY]
			-- Routines that ought to be in SPECIAL [detachable ANY]

	yyvs2: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

	yyvs3: SPECIAL [INTEGER]
			-- Stack for semantic values of type INTEGER

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [INTEGER]
			-- Routines that ought to be in SPECIAL [INTEGER]

	yyvs4: SPECIAL [REAL]
			-- Stack for semantic values of type REAL

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [REAL]
			-- Routines that ought to be in SPECIAL [REAL]

	yyvs5: SPECIAL [CHARACTER]
			-- Stack for semantic values of type CHARACTER

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [CHARACTER]
			-- Routines that ought to be in SPECIAL [CHARACTER]

	yyvs6: SPECIAL [detachable ARRAYED_LIST [ASSERTION]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [ASSERTION]

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [ASSERTION]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [ASSERTION]]

	yyvs7: SPECIAL [ASSERTION]
			-- Stack for semantic values of type ASSERTION

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [ASSERTION]
			-- Routines that ought to be in SPECIAL [ASSERTION]

	yyvs8: SPECIAL [C_ARCHETYPE_ROOT]
			-- Stack for semantic values of type C_ARCHETYPE_ROOT

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [C_ARCHETYPE_ROOT]
			-- Routines that ought to be in SPECIAL [C_ARCHETYPE_ROOT]

	yyvs9: SPECIAL [ARCHETYPE_INTERNAL_REF]
			-- Stack for semantic values of type ARCHETYPE_INTERNAL_REF

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [ARCHETYPE_INTERNAL_REF]
			-- Routines that ought to be in SPECIAL [ARCHETYPE_INTERNAL_REF]

	yyvs10: SPECIAL [SIBLING_ORDER]
			-- Stack for semantic values of type SIBLING_ORDER

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [SIBLING_ORDER]
			-- Routines that ought to be in SPECIAL [SIBLING_ORDER]

	yyvs11: SPECIAL [MULTIPLICITY_INTERVAL]
			-- Stack for semantic values of type MULTIPLICITY_INTERVAL

	yyvsc11: INTEGER
			-- Capacity of semantic value stack `yyvs11'

	yyvsp11: INTEGER
			-- Top of semantic value stack `yyvs11'

	yyspecial_routines11: KL_SPECIAL_ROUTINES [MULTIPLICITY_INTERVAL]
			-- Routines that ought to be in SPECIAL [MULTIPLICITY_INTERVAL]

	yyvs12: SPECIAL [CARDINALITY]
			-- Stack for semantic values of type CARDINALITY

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [CARDINALITY]
			-- Routines that ought to be in SPECIAL [CARDINALITY]

	yyvs13: SPECIAL [detachable MULTIPLICITY_INTERVAL]
			-- Stack for semantic values of type detachable MULTIPLICITY_INTERVAL

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [detachable MULTIPLICITY_INTERVAL]
			-- Routines that ought to be in SPECIAL [detachable MULTIPLICITY_INTERVAL]

	yyvs14: SPECIAL [detachable CARDINALITY]
			-- Stack for semantic values of type detachable CARDINALITY

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [detachable CARDINALITY]
			-- Routines that ought to be in SPECIAL [detachable CARDINALITY]

	yyvs15: SPECIAL [C_COMPLEX_OBJECT]
			-- Stack for semantic values of type C_COMPLEX_OBJECT

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [C_COMPLEX_OBJECT]
			-- Routines that ought to be in SPECIAL [C_COMPLEX_OBJECT]

	yyvs16: SPECIAL [C_PRIMITIVE_OBJECT]
			-- Stack for semantic values of type C_PRIMITIVE_OBJECT

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [C_PRIMITIVE_OBJECT]
			-- Routines that ought to be in SPECIAL [C_PRIMITIVE_OBJECT]

	yyvs17: SPECIAL [ARCHETYPE_SLOT]
			-- Stack for semantic values of type ARCHETYPE_SLOT

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [ARCHETYPE_SLOT]
			-- Routines that ought to be in SPECIAL [ARCHETYPE_SLOT]

	yyvs18: SPECIAL [C_ATTRIBUTE]
			-- Stack for semantic values of type C_ATTRIBUTE

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [C_ATTRIBUTE]
			-- Routines that ought to be in SPECIAL [C_ATTRIBUTE]

	yyvs19: SPECIAL [EXPR_ITEM]
			-- Stack for semantic values of type EXPR_ITEM

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [EXPR_ITEM]
			-- Routines that ought to be in SPECIAL [EXPR_ITEM]

	yyvs20: SPECIAL [EXPR_UNARY_OPERATOR]
			-- Stack for semantic values of type EXPR_UNARY_OPERATOR

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [EXPR_UNARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [EXPR_UNARY_OPERATOR]

	yyvs21: SPECIAL [EXPR_BINARY_OPERATOR]
			-- Stack for semantic values of type EXPR_BINARY_OPERATOR

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [EXPR_BINARY_OPERATOR]
			-- Routines that ought to be in SPECIAL [EXPR_BINARY_OPERATOR]

	yyvs22: SPECIAL [EXPR_LEAF]
			-- Stack for semantic values of type EXPR_LEAF

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [EXPR_LEAF]
			-- Routines that ought to be in SPECIAL [EXPR_LEAF]

	yyvs23: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs24: SPECIAL [ISO8601_DATE]
			-- Stack for semantic values of type ISO8601_DATE

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [ISO8601_DATE]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE]

	yyvs25: SPECIAL [ISO8601_DATE_TIME]
			-- Stack for semantic values of type ISO8601_DATE_TIME

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [ISO8601_DATE_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE_TIME]

	yyvs26: SPECIAL [ISO8601_TIME]
			-- Stack for semantic values of type ISO8601_TIME

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [ISO8601_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_TIME]

	yyvs27: SPECIAL [ISO8601_DURATION]
			-- Stack for semantic values of type ISO8601_DURATION

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [ISO8601_DURATION]
			-- Routines that ought to be in SPECIAL [ISO8601_DURATION]

	yyvs28: SPECIAL [URI]
			-- Stack for semantic values of type URI

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [URI]
			-- Routines that ought to be in SPECIAL [URI]

	yyvs29: SPECIAL [ARRAYED_LIST [STRING]]
			-- Stack for semantic values of type ARRAYED_LIST [STRING]

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [ARRAYED_LIST [STRING]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [STRING]]

	yyvs30: SPECIAL [ARRAYED_LIST [INTEGER]]
			-- Stack for semantic values of type ARRAYED_LIST [INTEGER]

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTEGER]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTEGER]]

	yyvs31: SPECIAL [ARRAYED_LIST [REAL]]
			-- Stack for semantic values of type ARRAYED_LIST [REAL]

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [ARRAYED_LIST [REAL]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [REAL]]

	yyvs32: SPECIAL [ARRAYED_LIST [BOOLEAN]]
			-- Stack for semantic values of type ARRAYED_LIST [BOOLEAN]

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [ARRAYED_LIST [BOOLEAN]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [BOOLEAN]]

	yyvs33: SPECIAL [ARRAYED_LIST [ISO8601_DATE]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE]

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE]]

	yyvs34: SPECIAL [ARRAYED_LIST [ISO8601_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_TIME]

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_TIME]]

	yyvs35: SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE_TIME]

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]

	yyvs36: SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DURATION]

	yyvsc36: INTEGER
			-- Capacity of semantic value stack `yyvs36'

	yyvsp36: INTEGER
			-- Top of semantic value stack `yyvs36'

	yyspecial_routines36: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]

	yyvs37: SPECIAL [INTERVAL [INTEGER]]
			-- Stack for semantic values of type INTERVAL [INTEGER]

	yyvsc37: INTEGER
			-- Capacity of semantic value stack `yyvs37'

	yyvsp37: INTEGER
			-- Top of semantic value stack `yyvs37'

	yyspecial_routines37: KL_SPECIAL_ROUTINES [INTERVAL [INTEGER]]
			-- Routines that ought to be in SPECIAL [INTERVAL [INTEGER]]

	yyvs38: SPECIAL [INTERVAL [REAL]]
			-- Stack for semantic values of type INTERVAL [REAL]

	yyvsc38: INTEGER
			-- Capacity of semantic value stack `yyvs38'

	yyvsp38: INTEGER
			-- Top of semantic value stack `yyvs38'

	yyspecial_routines38: KL_SPECIAL_ROUTINES [INTERVAL [REAL]]
			-- Routines that ought to be in SPECIAL [INTERVAL [REAL]]

	yyvs39: SPECIAL [INTERVAL [ISO8601_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_TIME]

	yyvsc39: INTEGER
			-- Capacity of semantic value stack `yyvs39'

	yyvsp39: INTEGER
			-- Top of semantic value stack `yyvs39'

	yyspecial_routines39: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_TIME]]

	yyvs40: SPECIAL [INTERVAL [ISO8601_DATE]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE]

	yyvsc40: INTEGER
			-- Capacity of semantic value stack `yyvs40'

	yyvsp40: INTEGER
			-- Top of semantic value stack `yyvs40'

	yyspecial_routines40: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE]]

	yyvs41: SPECIAL [INTERVAL [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE_TIME]

	yyvsc41: INTEGER
			-- Capacity of semantic value stack `yyvs41'

	yyvsp41: INTEGER
			-- Top of semantic value stack `yyvs41'

	yyspecial_routines41: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE_TIME]]

	yyvs42: SPECIAL [INTERVAL [ISO8601_DURATION]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DURATION]

	yyvsc42: INTEGER
			-- Capacity of semantic value stack `yyvs42'

	yyvsp42: INTEGER
			-- Top of semantic value stack `yyvs42'

	yyspecial_routines42: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DURATION]]

	yyvs43: SPECIAL [ARRAYED_LIST [INTERVAL [INTEGER]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [INTEGER]]

	yyvsc43: INTEGER
			-- Capacity of semantic value stack `yyvs43'

	yyvsp43: INTEGER
			-- Top of semantic value stack `yyvs43'

	yyspecial_routines43: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [INTEGER]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [INTEGER]]]

	yyvs44: SPECIAL [ARRAYED_LIST [INTERVAL [REAL]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [REAL]]

	yyvsc44: INTEGER
			-- Capacity of semantic value stack `yyvs44'

	yyvsp44: INTEGER
			-- Top of semantic value stack `yyvs44'

	yyspecial_routines44: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [REAL]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [REAL]]]

	yyvs45: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_TIME]]

	yyvsc45: INTEGER
			-- Capacity of semantic value stack `yyvs45'

	yyvsp45: INTEGER
			-- Top of semantic value stack `yyvs45'

	yyspecial_routines45: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]

	yyvs46: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DATE]]

	yyvsc46: INTEGER
			-- Capacity of semantic value stack `yyvs46'

	yyvsp46: INTEGER
			-- Top of semantic value stack `yyvs46'

	yyspecial_routines46: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]

	yyvs47: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]

	yyvsc47: INTEGER
			-- Capacity of semantic value stack `yyvs47'

	yyvsp47: INTEGER
			-- Top of semantic value stack `yyvs47'

	yyspecial_routines47: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]

	yyvs48: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]

	yyvsc48: INTEGER
			-- Capacity of semantic value stack `yyvs48'

	yyvsp48: INTEGER
			-- Top of semantic value stack `yyvs48'

	yyspecial_routines48: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]

	yyvs49: SPECIAL [C_BOOLEAN]
			-- Stack for semantic values of type C_BOOLEAN

	yyvsc49: INTEGER
			-- Capacity of semantic value stack `yyvs49'

	yyvsp49: INTEGER
			-- Top of semantic value stack `yyvs49'

	yyspecial_routines49: KL_SPECIAL_ROUTINES [C_BOOLEAN]
			-- Routines that ought to be in SPECIAL [C_BOOLEAN]

	yyvs50: SPECIAL [C_STRING]
			-- Stack for semantic values of type C_STRING

	yyvsc50: INTEGER
			-- Capacity of semantic value stack `yyvs50'

	yyvsp50: INTEGER
			-- Top of semantic value stack `yyvs50'

	yyspecial_routines50: KL_SPECIAL_ROUTINES [C_STRING]
			-- Routines that ought to be in SPECIAL [C_STRING]

	yyvs51: SPECIAL [C_DATE_TIME]
			-- Stack for semantic values of type C_DATE_TIME

	yyvsc51: INTEGER
			-- Capacity of semantic value stack `yyvs51'

	yyvsp51: INTEGER
			-- Top of semantic value stack `yyvs51'

	yyspecial_routines51: KL_SPECIAL_ROUTINES [C_DATE_TIME]
			-- Routines that ought to be in SPECIAL [C_DATE_TIME]

	yyvs52: SPECIAL [C_DURATION]
			-- Stack for semantic values of type C_DURATION

	yyvsc52: INTEGER
			-- Capacity of semantic value stack `yyvs52'

	yyvsp52: INTEGER
			-- Top of semantic value stack `yyvs52'

	yyspecial_routines52: KL_SPECIAL_ROUTINES [C_DURATION]
			-- Routines that ought to be in SPECIAL [C_DURATION]

	yyvs53: SPECIAL [C_DATE]
			-- Stack for semantic values of type C_DATE

	yyvsc53: INTEGER
			-- Capacity of semantic value stack `yyvs53'

	yyvsp53: INTEGER
			-- Top of semantic value stack `yyvs53'

	yyspecial_routines53: KL_SPECIAL_ROUTINES [C_DATE]
			-- Routines that ought to be in SPECIAL [C_DATE]

	yyvs54: SPECIAL [C_TIME]
			-- Stack for semantic values of type C_TIME

	yyvsc54: INTEGER
			-- Capacity of semantic value stack `yyvs54'

	yyvsp54: INTEGER
			-- Top of semantic value stack `yyvs54'

	yyspecial_routines54: KL_SPECIAL_ROUTINES [C_TIME]
			-- Routines that ought to be in SPECIAL [C_TIME]

	yyvs55: SPECIAL [C_REAL]
			-- Stack for semantic values of type C_REAL

	yyvsc55: INTEGER
			-- Capacity of semantic value stack `yyvs55'

	yyvsp55: INTEGER
			-- Top of semantic value stack `yyvs55'

	yyspecial_routines55: KL_SPECIAL_ROUTINES [C_REAL]
			-- Routines that ought to be in SPECIAL [C_REAL]

	yyvs56: SPECIAL [C_INTEGER]
			-- Stack for semantic values of type C_INTEGER

	yyvsc56: INTEGER
			-- Capacity of semantic value stack `yyvs56'

	yyvsp56: INTEGER
			-- Top of semantic value stack `yyvs56'

	yyspecial_routines56: KL_SPECIAL_ROUTINES [C_INTEGER]
			-- Routines that ought to be in SPECIAL [C_INTEGER]

	yyvs57: SPECIAL [C_TERMINOLOGY_CODE]
			-- Stack for semantic values of type C_TERMINOLOGY_CODE

	yyvsc57: INTEGER
			-- Capacity of semantic value stack `yyvs57'

	yyvsp57: INTEGER
			-- Top of semantic value stack `yyvs57'

	yyspecial_routines57: KL_SPECIAL_ROUTINES [C_TERMINOLOGY_CODE]
			-- Routines that ought to be in SPECIAL [C_TERMINOLOGY_CODE]

feature {NONE} -- Constants

	yyFinal: INTEGER = 560
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 89
			-- Number of tokens

	yyLast: INTEGER = 854
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 330
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 179
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Definitions

	Unbounded_value: INTEGER = -1

feature -- Initialization

	make
		do
			make_scanner
			make_parser_skeleton
			create object_nodes.make (0)
			create c_attrs.make (0)
			create time_vc
			create date_vc
			create str.make_empty
			create indent.make_empty
			create rm_attribute_name.make_empty
			create arch_internal_ref_rm_type_name.make_empty
			create parent_path_str.make_empty
		end

	reset
		do
			precursor
			validator_reset
			accept
		end

	execute (in_text:STRING; a_source_start_line: INTEGER; an_rm_schema: BMM_SCHEMA)
		do
			reset
			rm_schema := an_rm_schema
			source_start_line := a_source_start_line

			create indent.make_empty

			object_nodes.wipe_out
			c_attrs.wipe_out

			create time_vc
			create date_vc
	
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

	error_loc: STRING
		do
			create Result.make_empty
			if attached {YY_FILE_BUFFER} input_buffer as f_buffer then
				Result.append (f_buffer.file.name + ", ")
			end
			Result.append ("line " + (in_lineno + source_start_line).out)
			Result.append (" [last token = " + token_name (last_token) + "]")
		end

feature {NONE} -- Implementation

	rm_schema: BMM_SCHEMA
		attribute
			create Result.default_create
		end

	safe_put_c_attribute_child (an_attr: C_ATTRIBUTE; an_obj: C_OBJECT)
			-- check child object for validity and then put as new child
		require
			Not_already_added: not an_attr.has_child (an_obj)
		do
			debug ("ADL_parse")
				io.put_string (indent + "ATTR_NODE " + an_attr.rm_attribute_name + " put_child (" + 
						an_obj.generating_type + ": " + an_obj.rm_type_name + " [id=" + an_obj.node_id + "])%N") 
			end
			if check_c_attribute_child (an_attr, an_obj) then
				c_attrs.item.put_child (an_obj)
			end
		end

	check_c_attribute_child (an_attr: C_ATTRIBUTE; an_obj: C_OBJECT): BOOLEAN
			-- check a new child node
			-- FIXME: the semantics here should be rationalised with C_ATTRIBUTE.valid_child and related functions
		local
			err_code: STRING
			ar: ARRAYED_LIST[STRING]
		do
			create ar.make (0)
			create err_code.make_empty
			ar.extend (an_obj.generating_type) -- $1
			if an_obj.is_addressable then
				ar.extend ("node_id=" + an_obj.node_id) -- $2
			else
				ar.extend ("rm_type_name=" + an_obj.rm_type_name) -- $2
			end
			ar.extend (an_attr.rm_attribute_name) -- $3

			if an_attr.is_single then
				if an_obj.occurrences /= Void and then (an_obj.occurrences.upper_unbounded or an_obj.occurrences.upper > 1) then
					err_code := ec_VACSO
				elseif an_obj.is_addressable and an_attr.has_child_with_id (an_obj.node_id) then
					err_code := ec_VACSI
				elseif not an_obj.is_addressable and an_attr.has_child_with_rm_type_name (an_obj.rm_type_name) then
					err_code := ec_VACSIT
				else
					Result := True
				end
			elseif an_attr.is_multiple then
				if not an_obj.is_addressable then
					err_code := ec_VACMI
				elseif an_attr.has_child_with_id (an_obj.node_id) then
					err_code := ec_VACMM
				elseif (an_attr.cardinality /= Void and then not an_attr.cardinality.interval.upper_unbounded) and 
						(an_obj.occurrences /= Void and then not an_obj.occurrences.upper_unbounded) and
						an_obj.occurrences.upper > an_attr.cardinality.interval.upper then
					err_code := ec_VACMCU
					ar.extend (an_obj.occurrences.upper.out)
					ar.extend (an_attr.cardinality.interval.upper.out)
				else
					Result := True
				end
			end

			if not Result then
				abort_with_error (err_code, ar.to_array)
			end
		end

feature {NONE} -- Parse Tree

	object_nodes: ARRAYED_STACK [C_COMPLEX_OBJECT]

	c_attrs: ARRAYED_STACK [C_ATTRIBUTE]
			-- main stack of attributes during construction
		attribute
			create Result.make (0)
		end

	c_diff_attrs: ARRAYED_LIST [C_ATTRIBUTE]
			-- reference list of attributes with differential paths that require a special grafting process
		attribute
			create Result.make (0)
		end

	rm_attribute_name: STRING
	parent_path_str: STRING

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

	rm_prop_def: detachable BMM_PROPERTY_DEFINITION

	c_attr_tuple: C_ATTRIBUTE_TUPLE
		attribute
			create Result.make
		end

	c_attr_tuple_item: INTEGER

	c_attr_tuple_count: INTEGER

-------------- FOLLOWING TAKEN FROM ODIN_VALIDATOR.Y ---------------
feature {NONE} -- Implementation 

	arch_internal_ref_rm_type_name: STRING
	arch_internal_ref_node_id: detachable STRING

	indent: STRING

	str: STRING

	og_path: OG_PATH
		attribute
			create Result.make_root
		end

	archetype_id_parser: ARCHETYPE_HRID_PARSER
		once
			create Result.make
		end

end