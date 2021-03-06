module Dlibhydra
  # Journal Article metadata
  module JournalArticleMetadata
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :journal_resource,
                            class_name: 'Dlibhydra::Journal',
                            predicate: ::RDF::URI.new('https://vocab.org/frbr/core#partOf')
      
      def add_journal_article_values
        self.journal = journal_resource.collect { |x| x.preflabel }
      end
    end
  end
end
