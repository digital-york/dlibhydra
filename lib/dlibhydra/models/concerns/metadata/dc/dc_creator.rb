module Dlibhydra
  # DC creator
  module DcCreator
    extend ActiveSupport::Concern

    included do
      before_save :add_creator_label
      has_and_belongs_to_many :creator_resource,
                              class_name: 'Dlibhydra::CurrentPerson',
                              predicate: ::RDF::Vocab::DC.creator

      property :creator, predicate: ::RDF::Vocab::DC11.creator,
               multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end

      def add_creator_label
        creator_resource.each do | creator_res |
          self.creator << creator_res.preflabel
        end
      end

      class TextIndexer < Hydra::PCDM::PCDMIndexer
        def generate_solr_document
          super.tap do |solr_doc|
            # add a stored text index for the 'access_rights' property in solr
            # so that case-insensitive sorting can be done on it
            solr_doc['dc_creator'] = object.creator_resource
          end
        end
      end

    end
  end
end
