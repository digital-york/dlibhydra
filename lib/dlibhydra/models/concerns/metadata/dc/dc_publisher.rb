module Dlibhydra
  # DC publisher
  module DcPublisher
    extend ActiveSupport::Concern

    included do
      property :publisher, predicate: ::RDF::Vocab::DC.publisher,
                           multiple: false do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
