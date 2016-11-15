module Dlibhydra
  # exam paper
  class ExamPaper < Work

    include Dlibhydra::AddExamPaperMetadata

    type << ::RDF::URI.new('http://purl.org/spar/fabio/ExaminationPaper')

    def exam_paper?
      true
    end

    # Index additional fields into solr
    class ExamPaperIndexer < CurationConcerns::WorkIndexer # Hydra::PCDM::PCDMIndexer
      include Dlibhydra::IndexesExamPaper

    end

    def self.indexer
      ExamPaperIndexer
    end

  end
end
