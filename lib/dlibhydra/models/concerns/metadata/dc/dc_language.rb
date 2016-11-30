module Dlibhydra
  # DC language
  module DcLanguage
    extend ActiveSupport::Concern

    included do
      property :language, predicate: ::RDF::Vocab::DC.language,
                          multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
    end
  end
end
