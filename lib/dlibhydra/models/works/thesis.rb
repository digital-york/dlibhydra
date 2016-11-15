module Dlibhydra
  # thesis
  class Thesis < Work
    include Dlibhydra::AddThesisMetadata

    type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')

    # these don't work on 'create', but they do on first save
    before_save :add_department_values,
                :add_thesis_values,
                :add_qualification_name_values

    def thesis?
      true
    end

    # Index additional fields into solr
    class ThesisIndexer < CurationConcerns::WorkIndexer # Hydra::PCDM::PCDMIndexer
      include Dlibhydra::IndexesThesis
    end

    def self.indexer
      ThesisIndexer
    end
  end
end
