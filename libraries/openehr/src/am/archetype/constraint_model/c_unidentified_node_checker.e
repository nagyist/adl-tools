indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Archetype visitor to look for attributes that are either multiple or have multiple alternatives, whose
				 child objects are not identified, but only if the children are not C_PRIMITIVEs or
				 C_C_Os whose values are C_PRMITIVEs. Record any such nodes as warnings
		         ]"
	keywords:    "visitor, constraint model"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class C_UNIDENTIFIED_NODE_CHECKER

inherit
	C_VISITOR
		rename
			initialise as initialise_visitor
		redefine
			start_c_attribute
		end

feature -- Initialisation

	initialise(an_ontology: ARCHETYPE_ONTOLOGY) is
			-- set ontology required for interpreting meaning of object nodes
		require
			Ontology_valid: an_ontology /= Void
		do
			initialise_visitor(an_ontology)
			create warnings.make(0)
		end

feature -- Access

	warnings: STRING

feature -- Visitor

	start_c_attribute(a_node: C_ATTRIBUTE; depth: INTEGER) is
			-- FIXME: this can probably be done in a smarter way by an analysis of paths?
		local
			a_c_c_o, a_c_c_o_2: C_COMPLEX_OBJECT
			a_c_attr2: C_ATTRIBUTE
			found: BOOLEAN
		do
			-- only check nodes that are either multiple or are single but have multiple alternate children					
			if a_node /= Void and (a_node.is_multiple or else a_node.child_count > 1) then
				from
					a_node.children.start
				until
					a_node.children.off
				loop
					a_c_c_o ?= a_node.children.item

					if a_c_c_o /= Void and not a_c_c_o.is_addressable then
						-- see if it has children other than C_LEAF_OBJECTs
						from
							found := False
							a_c_c_o.attributes.start
						until
							a_c_c_o.attributes.off or found
						loop
							a_c_attr2 := a_c_c_o.attributes.item

							from
								a_c_attr2.children.start
							until
								a_c_attr2.children.off or found
							loop
								a_c_c_o_2 ?= a_c_attr2.children.item
								if a_c_c_o_2 /= Void then
									warnings.append("child node of type " + a_c_c_o.rm_type_name + " at path " +
										a_node.path + " has no id.%N")
									found := True
								end
								a_c_attr2.children.forth
							end

							a_c_c_o.attributes.forth
						end
					end
					a_node.children.forth
				end
			else

			end
		end

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is constraint_model_visitor.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
