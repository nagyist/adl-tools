note
	component:   "openEHR ADL Tools"
	description: "[
				 Profile of common settings relating to use of reference model(s) and terminology for a
				 given arhetype developing organisation.
				 ]"
	keywords:    "ADL, archetype, aom, profile"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AOM_PROFILE

inherit
	ANY_VALIDATOR

	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

	SHARED_BMM_MODEL_ACCESS

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

	ADL_MESSAGES_IDS
		export
			{NONE} all
		end

create
	make_dt

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- make in a safe way for DT building purposes
		do
			reset
			create profile_name.make_from_string (Default_aom_profile_name)
			create rm_aom_primitive_type_mappings.make (0)
			rm_aom_primitive_type_mappings.merge (c_primitive_subtypes)
			create matched_model_ids.make (0)
			create file_path.make_empty
		end

feature -- Identification

	profile_name: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

feature -- Access (attributes from file)

	rm_schema_pattern: STRING
			-- PERL regex based on id of publisher of Reference Models to which this profile applies.
			-- This is used to match the 'schema_id' generated in BMM_SCHEMA class based on model
			-- publisher, model name, model release found in .bmm files.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make_empty
		end

	terminology_profile: detachable AOM_TERMINOLOGY_PROFILE
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file

	archetype_visualise_descendants_of: STRING
			-- The effect of this attribute in visualisation is to generate the most natural tree or
			-- grid-based view of an archetype definition, from the semantic viewpoint.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make_empty
		end

	archetype_parent_class:  STRING
			-- name of a parent class used within the schema to provide archetype capability,
			-- enabling filtering of classes in RM visualisation. If empty, 'Any' is assumed
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_empty
		end

	archetype_data_value_parent_class: STRING
			-- name of a parent class of logical 'data types' used within the schema to provide archetype capability,
			-- enabling filtering of classes in RM visualisation. If empty, 'Any' is assumed
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_empty
		end

	aom_rm_type_mappings: HASH_TABLE [AOM_TYPE_MAPPING, STRING]
			-- mappings from AOM built-in types to actual types in RM: whenever
			-- the type name is encountered in an archetype, it is mapped to a specific RM type
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make(0)
		end

	aom_rm_type_substitutions: HASH_TABLE [STRING, STRING]
			-- allowed type substitutions: Actual RM type names keyed by AOM built-in types which can
			-- substitute for them in an archetype. E.g. <value = "String", key = "ISO8601_DATE"> means
			-- that if RM property TYPE.some_property is of type String, an ISO8601_DATE is allowed at that
			-- position in the archetype.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make (0)
		end

	rm_primitive_type_equivalences: HASH_TABLE [STRING, STRING]
			-- Equivalences of RM primitive types to in-built set of primitive types
			-- Used to determine which AOM C_PRIMITIVE_OBJECT descendant is used for a primitive type
			-- Typical entries:
			--  value		key
			--	"Real"		"Double"
			--	"Integer"	"Integer64"
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH profile file
		attribute
			create Result.make(0)
		end

	aom_lifecycle_mappings: HASH_TABLE [STRING, STRING]
			-- list of mappings of lifecycle state names used in archetypes to AOM lifecycle state
			-- names. value = AOM lifecycle state; key = source lifecycle state
		attribute
			create Result.make(0)
		end

	aom_lifecycle_mapping (a_state_name: STRING): STRING
		require
			has_lifecycle_state_mapping (a_state_name)
		do
			check attached aom_lifecycle_mappings.item (a_state_name.as_lower) as map_state then
				Result := map_state
			end
		end

feature -- Access

	file_path: STRING

	matched_model_ids: ARRAYED_LIST [STRING]
			-- list of rm schemas matched by `rm_schema_patterns'

	rm_aom_primitive_type_mappings: HASH_TABLE [STRING, STRING]
			-- Mapping from RM primitive types to AOM C_PRIMITIVE_OBJECT descendant type for this schema
			-- Assumed primitive types and their C_XX mappings for all schemas are in `c_primitive_subtypes'
			-- Keyed by RM type upper case

	aom_primitive_type (rm_type_name: STRING): STRING
			-- obtain AOM primitive type for any inbuilt or mapped primitive type
		require
			has_aom_primitive_type (rm_type_name)
		do
			check attached rm_aom_primitive_type_mappings.item (rm_type_name.as_upper) as aom_type_name then
				Result := aom_type_name
			end
		end

feature -- Status Report

	has_type_substitution (an_aom_type, an_rm_type: STRING): BOOLEAN
			-- is there a type substitution for `an_aom_type', `an_rm_type'?
		local
			a_key: STRING
			finished: BOOLEAN
		do
			if attached aom_rm_type_substitutions as att_type_subs then
				from
					a_key := an_aom_type
				until
					Result or finished
				loop
					if attached att_type_subs.item (a_key) as att_type_subs_item then
						Result := att_type_subs_item.is_case_insensitive_equal (an_rm_type)
						if not Result then
							a_key := att_type_subs_item
						end
					else
						finished := True
					end
				end
			end
		end

	has_any_type_substitution (an_aom_type: STRING): BOOLEAN
			-- is there any type substitution for `an_aom_type'?
		do
			Result := aom_rm_type_substitutions.has (an_aom_type)
		end

	has_lifecycle_state_mapping (a_state_name: STRING): BOOLEAN
			-- is there an AOM lifecycle state for `a_state_name'?
		do
			Result := aom_lifecycle_mappings.has (a_state_name.as_lower)
		end

	has_rm_aom_primitive_type_mapping (an_rm_type, an_aom_type: STRING): BOOLEAN
			-- is there a type equivalence for `an_aom_type', `an_rm_type'?
		do
			Result := attached rm_aom_primitive_type_mappings.item (an_rm_type.as_upper) as att_type_eq_type and then
				att_type_eq_type.is_case_insensitive_equal (an_aom_type)
		end

	has_aom_primitive_type_mapping_for_rm_type (an_rm_type: STRING): BOOLEAN
			-- is there a type equivalence for `an_rm_type'?
		do
			Result := rm_aom_primitive_type_mappings.has (an_rm_type.as_upper)
		end

	aom_primitive_type_mapping_for_rm_type (an_rm_type: STRING): STRING
			-- Return the a type equivalence for `an_aom_type', `an_rm_type'?
		require
			has_aom_primitive_type_mapping_for_rm_type (an_rm_type)
		do
			check attached rm_aom_primitive_type_mappings.item (an_rm_type.as_upper) as att_type_eq_type then
				Result := att_type_eq_type
			end
		end

	has_aom_primitive_type (a_type_name: STRING): BOOLEAN
			-- True if `a_type_name' is a primitive type in the current type system
		do
			Result := rm_aom_primitive_type_mappings.has (a_type_name.as_upper)
		end

feature -- Validation

	validate
		local
			bm: BMM_MODEL
			rm_class_name: STRING
		do
			if profile_name.is_equal (Default_aom_profile_name) then
				add_error (ec_ARP_no_profile_name, <<file_path>>)
			end
			if matched_model_ids.is_empty then
				add_error (ec_ARP_no_matching_schemas, <<file_path>>)
			else
				-- check that all type mappings are found in all mentioned schemas
				across matched_model_ids as models_csr loop
					if has_bmm_model (models_csr.item) then
						bm := bmm_model (models_csr.item)
						across aom_rm_type_mappings as type_mappings_csr loop
							rm_class_name := type_mappings_csr.item.target_class_name
							if not bm.has_class_definition (type_mappings_csr.item.target_class_name) then
								add_error (ec_ARP_invalid_class_mapping, <<type_mappings_csr.item.source_class_name,
									rm_class_name, bm.model_id>>)
							else
								if attached type_mappings_csr.item.property_mappings as prop_mappings then
									across prop_mappings as property_mappings_csr loop
										if not bm.has_property (rm_class_name, property_mappings_csr.item.target_property_name) then
											add_error (ec_ARP_invalid_property_mapping, <<type_mappings_csr.item.source_class_name,
												property_mappings_csr.item.source_property_name,
												rm_class_name, property_mappings_csr.item.target_property_name, bm.model_id>>)
										end
									end
								end
							end
						end
					end
				end

				-- check lifecycle state mappings
				across aom_lifecycle_mappings as ls_csr loop
					if not Resource_lifecycle_states.has (ls_csr.item) then
						add_error (ec_ARP_invalid_lifecycle_state_mapping, <<ls_csr.key, ls_csr.item, profile_name>>)
					end
				end
			end
		end

feature -- Modification

	set_file_path (a_path: STRING)
		do
			file_path := a_path
		end

feature {DT_OBJECT_CONVERTER} -- Persistence

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

	finalise_dt
			-- Finalisation work: evaluate rm schema regexes
		local
			lc_aom_lifecycle_mappings: detachable HASH_TABLE [STRING, STRING]
			default_rm_type_key: STRING
		do
			if bmm_models_access.load_attempted then
				get_regex_matches (rm_schema_pattern)
			else
				add_error (ec_ARP_no_bmm_schemas_loaded, Void)
			end

			-- merge default RM/AOM primitive type mappings into those found in AOM profile
			across rm_primitive_type_equivalences as rm_prim_types_csr loop
				default_rm_type_key := rm_prim_types_csr.item.as_upper
				if rm_aom_primitive_type_mappings.has (default_rm_type_key) and then
					attached rm_aom_primitive_type_mappings.item (default_rm_type_key) as aom_type
				then
					rm_aom_primitive_type_mappings.put (aom_type, rm_prim_types_csr.key.as_upper)
				end
			end

			-- convert lifecycle states table to all lower case
			create lc_aom_lifecycle_mappings.make (0)
			across aom_lifecycle_mappings as state_mappings_csr loop
				lc_aom_lifecycle_mappings.put (state_mappings_csr.item.as_lower, state_mappings_csr.key.as_lower)
			end
			aom_lifecycle_mappings := lc_aom_lifecycle_mappings
		end

	get_regex_matches (a_regex: STRING)
			-- Finalisation work: evaluate rm schema regexes
		require
			bmm_models_access.load_attempted
		local
			regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		do
			-- deal with RM schema regexes
			create regex_matcher.make
			regex_matcher.set_case_insensitive (True)
			regex_matcher.compile (a_regex)
			if regex_matcher.is_compiled then
				across bmm_model_ids as model_ids_csr loop
					if regex_matcher.recognizes (model_ids_csr.item.as_string_8) then
						matched_model_ids.extend (model_ids_csr.item.as_string_8)
					end
				end
			else
				add_error (ec_regex_e1, <<a_regex>>)
			end
		end

end



