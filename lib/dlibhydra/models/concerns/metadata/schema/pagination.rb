module Dlibhydra
  # Pagination
  module Pagination
    extend ActiveSupport::Concern

    included do
      property :pagination, predicate: RDF::Vocab::SCHEMA.pagination,
                           multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
