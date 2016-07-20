module Dlibhydra
  module DcPublisher
    extend ActiveSupport::Concern

    included do
      property :publisher, predicate: ::RDF::Vocab::DC.creator, multiple: false do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
