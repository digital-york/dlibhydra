module Dlibhydra
  # dataset
  class Dataset < Work
    include Dlibhydra::AddDatasetMetadata

    filters_association :members, as: :aips, condition: :aip?
    filters_association :members, as: :dips, condition: :dip?
    filters_association :members, as: :packages, condition: :package?

    type << ::RDF::Vocab::DCAT.Dataset

    has_and_belongs_to_many :managing_organisation,
                            class_name: 'Dlibhydra::CurrentOrganisation',
                            predicate:
                                Dlibhydra::Vocab::PureTerms.pureManagingUnit

    # TODO look at how CC handles this and fix clash
    # where does this come from? is it in pure? NOT IN PUREE check ws
    property :embargo_release,
             predicate: Dlibhydra::Vocab::Generic.embargoRelease,
             multiple: false do |index|
      index.as :stored_searchable
    end
    property :retention_policy,
             predicate: Dlibhydra::Vocab::Generic.retentionPolicy,
             multiple: false do |index|
      index.as :stored_searchable
    end
    property :restriction_note,
             predicate: Dlibhydra::Vocab::Generic.restrictionNote,
             multiple: true do |index|
      index.as :stored_searchable
    end

    def dataset?
      true
    end

    # Force the type of certain indexed fields in solr
    # (inspired by
    #   http://projecthydra.github.io/training/deeper_into_hydra/#slide-63,
    #   http://projecthydra.github.io/training/deeper_into_hydra/#slide-64
    #   and discussed at
    #   https://groups.google.com/forum/#!topic/hydra-tech/rRsBwdvh5dE)
    # This is to overcome limitations with solrizer and
    #   "index.as :stored_sortable" always defaulting to string rather
    #   than text type (solr sorting on string fields is case-sensitive,
    #   on text fields it's case-insensitive)
    # Extend Hydra::PCDM::PCDMIndexer instead of ActiveFedora::IndexingService
    class TextIndexer < Hydra::PCDM::PCDMIndexer
      def generate_solr_document
        # Add '_value' to 'values_tesim'
        #   this enables update_usages in authorities to update the object
        #   if the authority term changes
        values_to_index = ['creator','publisher','managing_organisation']

        super.tap do |solr_doc|
          # add a stored text index for the 'access_rights' property in solr
          # so that case-insensitive sorting can be done on it
          solr_doc['dc_access_rights_tesi'] = object.dc_access_rights

          solr_doc['values_tesim'] = []
          values_to_index.each do |v|
            method = "#{v}_resource"
            solr_doc["#{v}_value_alt_tesim"] = []
            prefs = object.send(method).collect { |x| x.preflabel }
            solr_doc["#{v}_value_tesim"] = prefs # stored searchable
            solr_doc["#{v}_value_sim"] = prefs # facetable
            object.send(method).each do |a|
              solr_doc["#{v}_value_alt_tesim"] += a.altlabel.to_a
            end
            solr_doc['values_tesim'] += object.send(method).collect { |x| x.id }
          end

        end
      end
    end

    def self.indexer
      TextIndexer
    end
  end
end