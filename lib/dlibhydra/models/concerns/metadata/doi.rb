module Dlibhydra
  module Doi
    extend ActiveSupport::Concern

    # Or ::RDF::Vocab::DataCite ?

    included do
      property :doi, predicate: ::RDF::Vocab::Identifiers.doi, multiple: true do |index|
        index.as :stored_searchable
      end
    end

  end
end
