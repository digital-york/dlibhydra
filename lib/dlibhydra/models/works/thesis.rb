module Dlibhydra
  # thesis
  class Thesis < Work
    include Dlibhydra::AddThesisMetadata

    type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')

    def thesis?
      true
    end

    # Index additional fields into solr
    class ThesisIndexer < Hyrax::WorkIndexer # Hydra::PCDM::PCDMIndexer
      include Dlibhydra::IndexesThesis
    end

    def self.indexer
      ThesisIndexer
    end
  end
end
