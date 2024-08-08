note
	component:   "openEHR ADL Tools"
	description: "Statistical report data container for archetypes."
	keywords:    "statistics, archetype"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ARCHETYPE_STATISTICAL_REPORT

inherit
	ARCHETYPE_STATISTICAL_DEFINITIONS

	SHARED_AOM_PROFILES_ACCESS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (an_rm: BMM_MODEL)
		local
			aom_profile: AOM_PROFILE
		do
			ref_model :=  an_rm
			Archetype_metric_names.do_all (
				agent (metric_name: READABLE_STRING_8)
					do
						archetype_metrics.put (create {STATISTICAL_DATUM}.make (metric_name), metric_name)
					end
			)

			if aom_profiles_access.has_profile_for_rm_schema (ref_model.model_id) then
				aom_profile := aom_profiles_access.profile_for_rm_schema (ref_model.model_id)
				archetype_parent_class := aom_profile.archetype_parent_class
				archetype_data_value_parent_class := aom_profile.archetype_data_value_parent_class
			end

			-- set up the RM class breakdown tables according to major base class groups, found in BMM_SCHEMA. If
			-- no 'LOCATABLE' or equivalent class declared, create a default table. Additionally create a
			-- primitive types table (for nodes that archetype RM types like String, Integer etc), since this can
			-- always be detected
			if not archetype_parent_class.is_empty then
				rm_grouped_class_table.put (default_rm_class_table, archetype_parent_class)
			else
				rm_grouped_class_table.put (default_rm_class_table, "Any")
			end
			if not archetype_data_value_parent_class.is_empty then
				rm_grouped_class_table.put (create {STRING_TABLE [RM_CLASS_STATISTICS]}.make(0), archetype_data_value_parent_class)
			end
			rm_grouped_class_table.put (create {STRING_TABLE [RM_CLASS_STATISTICS]}.make(0), Rm_primitive_group_key)
		end

feature -- Access

	archetype_metrics: STRING_TABLE [STATISTICAL_DATUM]
			-- other archetype metrics (not relating to RM), keyed by metric name
		attribute
			create Result.make (0)
		end

	archetype_metrics_item (a_key: STRING): STATISTICAL_DATUM
		require
			Archetype_metric_names.has (a_key)
		do
			check attached archetype_metrics.item (a_key) as att_item then
				Result := att_item
			end
		end

	archetype_metrics_list: STRING_TABLE [LIST [STRING]]
		do
			create Result.make (0)
			across archetype_metrics as stat_items_csr loop
				Result.put (stat_items_csr.item.as_list, stat_items_csr.key)
			end
		end

	rm_grouped_class_table: STRING_TABLE [STRING_TABLE [RM_CLASS_STATISTICS]]
			-- table of grouped stats of all RM classes, keyed by class name, with
			-- each group keyed by a base class name, e.g. 'LOCATABLE', 'DATA_VALUE', 'Any' etc
		attribute
			create Result.make (0)
		end

	ref_model: BMM_MODEL

	archetype_data_value_parent_class: STRING
		attribute
			create Result.make (0)
		end

	archetype_parent_class: STRING
		attribute
			create Result.make (0)
		end

feature -- Modification

	add_rm_class_stats (a_stat_accum: RM_CLASS_STATISTICS)
		local
			rm_class_table: STRING_TABLE [RM_CLASS_STATISTICS]
		do
			if ref_model.is_primitive_type (a_stat_accum.rm_class_name) and then attached rm_grouped_class_table.item (Rm_primitive_group_key) as rgct_prim then
				rm_class_table := rgct_prim
			elseif attached archetype_parent_class as apc and then ref_model.is_descendant_of (a_stat_accum.rm_class_name, apc) and then
				attached rm_grouped_class_table.item (apc) as rgct_apc then
				rm_class_table := rgct_apc
			elseif attached archetype_data_value_parent_class as advpc and then ref_model.is_descendant_of (a_stat_accum.rm_class_name, advpc) and then
				attached rm_grouped_class_table.item (advpc) as rgct_dvpc then
				rm_class_table := rgct_dvpc
			else
				rm_class_table := default_rm_class_table
			end

			if rm_class_table.has (a_stat_accum.rm_class_name) and then attached rm_class_table.item (a_stat_accum.rm_class_name) as rct then
				rct.merge (a_stat_accum)
			else
				rm_class_table.put (a_stat_accum, a_stat_accum.rm_class_name)
			end
		end

	increment_archetype_metric (a_val: INTEGER; a_metric_name: STRING)
			-- add `a_val' to `archetype_metrics'
		require
			archetype_metrics.has (a_metric_name)
		do
			check attached archetype_metrics.item (a_metric_name) as att_metric then
				att_metric.update (a_val)
			end
		end

	merge (other: like Current)
			-- merge another stats report into this one, creating aggregated statistics
		require
			other.ref_model = ref_model
		local
			merged_class_stats: RM_CLASS_STATISTICS
		do
			-- archetype metrics table
			across other.archetype_metrics as metrics_csr loop
				if attached archetype_metrics.item (metrics_csr.key) as att_metrics then
					att_metrics.merge (metrics_csr.item)
				end
			end

			-- rm class table
			across other.rm_grouped_class_table as other_grouped_table_csr loop
				if rm_grouped_class_table.has (other_grouped_table_csr.key) and then attached rm_grouped_class_table.item (other_grouped_table_csr.key) as rm_class_table then
					across other_grouped_table_csr.item as other_table_csr loop
						if rm_class_table.has (other_table_csr.key) and then attached rm_class_table.item (other_table_csr.key) as att_rm_class then
							merged_class_stats := att_rm_class.deep_twin
							merged_class_stats.merge (other_table_csr.item)
							rm_class_table.force (merged_class_stats, other_table_csr.key)
						else
							rm_class_table.put (other_table_csr.item.deep_twin, other_table_csr.key)
						end
					end
				else
					rm_grouped_class_table.put (other_grouped_table_csr.item.deep_twin, other_grouped_table_csr.key)
				end
			end
		end

feature -- Copying

	duplicate: like Current
			-- safe duplicate with full copies of states, but reference copy of `ref_model'
		do
			create Result.make (ref_model)
			Result.archetype_metrics.copy (archetype_metrics.deep_twin)
			Result.rm_grouped_class_table.copy (rm_grouped_class_table.deep_twin)
		end

feature {NONE} -- Implementation

	default_rm_class_table: STRING_TABLE [RM_CLASS_STATISTICS]
		attribute
			create Result.make (0)
		end

end


