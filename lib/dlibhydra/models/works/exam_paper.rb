module Dlibhydra
  # exam paper
  class ExamPaper < Work

    include Dlibhydra::AddExamPaperMetadata

    type << ::RDF::URI.new('http://purl.org/spar/fabio/ExaminationPaper')

    def exam_paper?
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
