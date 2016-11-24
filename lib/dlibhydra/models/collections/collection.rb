module Dlibhydra
  class Collection < ActiveFedora::Base
    # TODO check CC Collection Behaviour
    include CurationConcerns::CollectionBehavior, #Hydra::Works::CollectionBehavior,
            Dlibhydra::AddLabels,
            Dlibhydra::AddDcDescriptive,
            Dlibhydra::DcRights,
            Dlibhydra::DcPublisher

    def authority?
      false
    end
    def work?
      false
    end
    def file_set?
      false
    end
    def collection?
      true
    end

    # add the preflabel for _resource objects into solr
    class TextIndexer < Hydra::PCDM::PCDMIndexer
      def generate_solr_document
        super.tap do |solr_doc|
          # TODO add facetable
          solr_doc['creator_value_tesim'] = object.creator_resource.collect { |x| x.preflabel }
          solr_doc['subject_value_tesim'] = object.subject_resource.collect { |x| x.preflabel }
        end
      end
    end

    def self.indexer
      TextIndexer
    end
  end
end
