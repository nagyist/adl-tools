note
	component:   "openEHR ADL Tools"
	description: "Visitor to build list of path references found in assertions"
	keywords:    "visitor, assertion expressions"
	author:      "Peter Gummer <peter.gummer@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2008- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EXPR_XREF_BUILDER

inherit
	EXPR_VISITOR
		redefine
			start_expr_archetype_ref
		end

feature {NONE} -- Initialisation

	initialise (an_archetype: ARCHETYPE; an_assertion: ASSERTION)
			-- set assertion
		do
			archetype := an_archetype
		end

feature -- Visitor

	start_expr_archetype_ref (a_node: EXPR_ARCHETYPE_REF; depth: INTEGER)
			-- enter an EXPR_ARCHETYPE_REF
		do
			if a_node.is_archetype_definition_ref and attached {STRING} a_node.item as tgt_path then
				if not archetype.rules_index.has (tgt_path) then
					archetype.rules_index.put (create {ARRAYED_LIST[EXPR_ARCHETYPE_REF]}.make(0), tgt_path)
				end
				archetype.rules_index.item (tgt_path).extend (a_node)
			end
		end

feature {NONE} -- Implementation

	archetype: detachable ARCHETYPE
		note
			option: stable
		attribute
		end

end


