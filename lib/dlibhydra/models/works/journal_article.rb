module Dlibhydra
  # Journal Article
  class JournalArticle < Work
    include Dlibhydra::AddJournalArticleMetadata

    type << ::RDF::URI.new('http://purl.org/spar/fabio/JournalArticle')

#    before_save :add_qualification_name_values

    def journal_article?
      true
    end

    # Index additional fields into solr
    class JournalArticleIndexer < CurationConcerns::WorkIndexer # Hydra::PCDM::PCDMIndexer
      include Dlibhydra::IndexesJournalArticle
    end

    def self.indexer
      JournalArticleIndexer
    end
  end
end
