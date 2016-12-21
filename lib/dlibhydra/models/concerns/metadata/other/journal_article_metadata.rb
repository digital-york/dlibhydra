module Dlibhydra
  # Journal Article metadata
  module JournalArticleMetadata
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :journal,
                            class_name: 'Dlibhydra::Journal',
                            predicate: ::RDF::URI.new('https://vocab.org/frbr/core#partOf')
      
    end
  end
end
