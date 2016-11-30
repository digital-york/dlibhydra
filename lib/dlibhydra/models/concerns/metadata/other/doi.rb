module Dlibhydra
  # doi
  module Doi
    extend ActiveSupport::Concern

    included do
      property :doi, predicate: ::RDF::Vocab::Identifiers.doi,
                     multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
