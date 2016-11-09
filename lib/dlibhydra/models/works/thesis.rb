module Dlibhydra
  # thesis
  class Thesis < Work
    include Dlibhydra::AddThesisMetadata

    type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')

    def thesis?
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
