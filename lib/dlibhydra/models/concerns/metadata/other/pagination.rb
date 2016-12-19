module Dlibhydra
  # Pagination
  module Pagination
    extend ActiveSupport::Concern

    included do
      property :pagination, predicate: ::RDF::URI.new('https://schema.org/pagination'),
                           multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
