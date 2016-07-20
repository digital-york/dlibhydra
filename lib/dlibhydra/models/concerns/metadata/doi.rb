module Dlibhydra
  module Doi
    extend ActiveSupport::Concern

    # Or ::Rdf::Vocab::DataCite ?

    included do
      property :doi, predicate: ::Rdf::Vocab::Identifiers.doi, multiple: true do |index|
        index.as :stored_searchable
      end
    end

  end
end
