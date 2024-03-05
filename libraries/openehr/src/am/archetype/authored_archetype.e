note
	component:   "openEHR ADL Tools"
	description: "Authored archetype abstraction"
	keywords:    "archetype, authored, metadata"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

 class AUTHORED_ARCHETYPE

inherit
	ARCHETYPE
		rename
			make as make_archetype,
			make_all as make_all_archetype,
			make_empty_differential as make_empty_differential_archetype,
			make_empty_differential_child as make_empty_differential_child_archetype
		undefine
			has_language, languages_available, has_matching_language_tag, original_language
		redefine
			default_create, make_from_other, overlay_differential, set_original_language,
			reduce_languages_to, add_language, set_is_valid
		end

	AUTHORED_RESOURCE
		undefine
			make_from_other
		redefine
			default_create, add_language, reduce_languages_to, set_original_language
		end

create
	default_create

create {ADL_14_ENGINE, ARCHETYPE}
	make

create {ADL_2_ENGINE, ADL_14_ENGINE, P_ARCHETYPE}
	make_all

create {ARCH_LIB_ARCHETYPE}
	make_empty_differential, make_empty_differential_child

feature -- Initialisation

	default_create
		do
			make_empty_differential (create {ARCHETYPE_HRID}.default_create, "1.0.0", default_language)
		end

	make (an_adl_version: like adl_version;
			an_rm_release: like rm_release;
			an_id: like archetype_id;
			an_original_language: like original_language;
			a_uid: like uid;
			a_build_uid: like build_uid;
			a_description: like description;
			a_definition: like definition;
			a_terminology: like terminology)
				-- make from pieces, typically obtained by parsing
		do
			make_archetype (an_id, a_definition, a_terminology)
			adl_version := an_adl_version
			rm_release := an_rm_release
			set_original_language (an_original_language)
			description := a_description
			uid := a_uid
			build_uid := a_build_uid
		ensure then
			Adl_version_set: adl_version = an_adl_version
			Rm_release_set: rm_release = an_rm_release
			Original_language_set: original_language = an_original_language
			Description_set: description = a_description
			Uid_set: uid = a_uid
			Build_uid_set: build_uid = a_build_uid
		end

	make_all (an_adl_version: like adl_version;
			an_rm_release: like rm_release;
			an_id: like archetype_id;
			a_parent_archetype_id: like parent_archetype_id;
			is_controlled_flag: BOOLEAN;
			a_uid: like uid;
			a_build_uid: like build_uid;
			an_other_metadata: like other_metadata;
			an_original_language: like original_language;
			a_translations: like translations;
			a_description: like description;
			a_definition: like definition;
			a_rules: like rules;
			a_terminology: like terminology;
			an_annotations: like annotations)
				-- make from all possible items
		require
			Rules_valid: attached a_rules as att_rules implies not att_rules.is_empty
		do
			make (an_adl_version, an_rm_release, an_id, an_original_language, a_uid, a_build_uid, a_description, a_definition, a_terminology)
			parent_archetype_id := a_parent_archetype_id
			translations := a_translations
			is_controlled := is_controlled_flag
			other_metadata := an_other_metadata
			rules := a_rules
			annotations := an_annotations
		ensure
			Adl_version_set: adl_version = an_adl_version
			Rm_release_set: rm_release = an_rm_release
			Is_controlled_set: is_controlled = is_controlled_flag
			Id_set: archetype_id = an_id
			Parent_id_set: parent_archetype_id = a_parent_archetype_id
			Original_language_set: original_language = an_original_language
			Translations_set: translations = a_translations
			Definition_set: definition = a_definition
			Invariants_set: rules = a_rules
			Terminology_set: terminology = a_terminology
			Is_differential_follows_terminology: is_differential = a_terminology.is_differential
			Is_dirty: is_dirty
			Not_generated: not is_generated
		end

	make_from_other (other: AUTHORED_ARCHETYPE)
			-- duplicate from another archetype
		do
			precursor {ARCHETYPE} (other)
			is_controlled := other.is_controlled
			adl_version := other.adl_version.twin
			rm_release := other.rm_release.twin
			if attached other.uid as att_other_uid then
				uid := att_other_uid.twin
			end
			if attached other.build_uid as att_other_uid then
				build_uid := att_other_uid.twin
			end
			set_original_language (other.original_language)
			if not other.other_metadata.is_empty then
				other_metadata := other.other_metadata.deep_twin
			end
			if not other.translations.is_empty then
				translations := other.translations.deep_twin
			end
			description := other.description.deep_twin
			if attached other.annotations as other_annots then
				annotations := other_annots.deep_twin
			end
		ensure then
			Other_metadata_copied: not other_metadata.is_empty implies (other.other_metadata.is_deep_equal (other_metadata))
			Translations_copied: not translations.is_empty implies (other.translations.is_deep_equal (translations))
			Description_copied: description.is_deep_equal (other.description)
			Annotations_copied: attached annotations as att_ann implies (attached other.annotations as att_other_ann and then att_ann.is_deep_equal (att_other_ann))
		end

feature {ARCH_LIB_ARCHETYPE} -- Initialisation

	make_empty_differential (an_id: like archetype_id; an_rm_release, an_original_lang_str: STRING)
			-- make a new differential form archetype
		do
			create original_language.make (ts.default_language_code_set, an_original_lang_str)
			make_empty_differential_archetype (an_id, an_original_lang_str)
			create adl_version.make_from_string (Latest_adl_version)
			rm_release := an_rm_release
			create description.make_language (an_original_lang_str)
		ensure then
			Adl_version_set: adl_version.same_string (Latest_adl_version)
			Rm_release_set: rm_release = an_rm_release
		end

	make_empty_differential_child (spec_depth: INTEGER; an_id: like archetype_id; a_parent_id, an_rm_release, an_original_lang_str: STRING)
			-- make a new differential form archetype as a child of `a_parent'
		do
			create original_language.make (ts.default_language_code_set, an_original_lang_str)
			make_empty_differential_child_archetype (spec_depth, an_id, a_parent_id, an_original_lang_str)
			create adl_version.make_from_string (Latest_adl_version)
			rm_release := an_rm_release
			create description.make_language (an_original_lang_str)
		ensure then
			Adl_version_set: adl_version.same_string (Latest_adl_version)
			Rm_release_set: rm_release = an_rm_release
		end

feature -- Access

	build_uid: detachable HIER_OBJECT_ID
			-- Unique identifier of this archetype artefact instance. A new identifier is assigned every
			-- time the content is changed by a tool. Used by tools to distinguish different revisions and/or
			-- interim snapshots of the same artefact.

	adl_version: STRING
			-- Semver.org compatible version of ADL/AOM used in this archetype

	rm_release: STRING
			-- Semver.org compatible release of the reference model on which the archetype was based.
			-- This does not imply conformance only to this release, since an archetype may
			-- be valid with respect to multiple releases of a reference model. Conformance is captured
			-- outside of the archetype.

	other_metadata: HASH_TABLE [STRING, STRING]
			-- other top-level meta-data
		attribute
			create Result.make (0)
		end

feature -- Modification

	set_original_language (a_lang: TERMINOLOGY_CODE)
		do
			precursor {AUTHORED_RESOURCE} (a_lang)
			precursor {ARCHETYPE} (a_lang)
		end

	set_is_valid
		do
			precursor
			set_adl_version (latest_adl_version)
		end

	set_adl_version (a_ver: STRING)
			-- set `adl_version' with a string containing only '.' and numbers,
			-- not commencing or finishing in '.'
		require
			Valid_version: valid_standard_version(a_ver)
		do
			adl_version := a_ver
		end

	set_rm_release (a_ver: STRING)
			-- set `rm_release' with a string containing only '.' and numbers,
			-- not commencing or finishing in '.'
		require
			Valid_version: valid_standard_version (a_ver)
		do
			rm_release := a_ver
		end

	set_build_uid (a_build_uid: STRING)
		do
			create build_uid.make_from_string (a_build_uid)
		end

	set_other_metadata (a_metadata: like other_metadata)
		do
			other_metadata := a_metadata
		end

	put_other_metadata_value (a_key, a_value: STRING)
			-- add the pair `a_key' / `a_value' to `other_metadata', overwriting any value
			-- with the same key if necessary.
		do
			other_metadata.force (a_value, a_key)
		ensure
			attached other_metadata.item (a_key) as att_omd_item and then att_omd_item = a_value
		end

	put_other_metadata_flag (a_key: STRING)
			-- add a meta-data item of the form of a flag, whose value is implied to be 'true',
			-- overwriting any value with the same key if necessary.
		do
			put_other_metadata_value (a_key, (True).out)
		ensure
			attached other_metadata.item (a_key) as att_md_item and then att_md_item.is_equal ((True).out)
		end

	add_language (a_lang_tag: STRING)
		do
			precursor {ARCHETYPE} (a_lang_tag)
			precursor {AUTHORED_RESOURCE} (a_lang_tag)
		end

	reduce_languages_to (a_langs: ARRAYED_SET [STRING])
			-- reduce languages to those in the supplied list
		do
			precursor {ARCHETYPE} (a_langs)
			precursor {AUTHORED_RESOURCE} (a_langs)
		end

feature {ARCHETYPE_FLATTENER} -- Flattening

	overlay_differential (a_diff: ARCHETYPE)
			-- <<precursor>>
			-- If `a_diff' is an AUTHORED_ARCHETYPE, the following items from the differential are used:
			--	* uid
			--	* other_metadata
			--	* translations
			--	* description
		do
			precursor (a_diff)

			if attached {AUTHORED_ARCHETYPE} a_diff as diff_auth_arch then
				-- identifiers
				if attached diff_auth_arch.build_uid as att_uid then
					build_uid := att_uid.deep_twin
				end

				-- flatten other_metadata so that child archetype values overwrite any parent values with same key;
				-- otherwise parent key/val pairs are preserved
				if attached diff_auth_arch.other_metadata as diff_omd then
					across diff_omd as md_csr loop
						put_other_metadata_value (md_csr.key, md_csr.item)
					end
				end

				-- remove translations meta-data
			--	remove_translations

				-- replace description with differential
				if attached diff_auth_arch.description as diff_desc then
					description := diff_desc.deep_twin
				end
			end
		end

end
