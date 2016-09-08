module Dlibhydra
  # DC date available
  module DcAvailable
    extend ActiveSupport::Concern

    included do
      property :date_available, predicate: ::RDF::Vocab::DC.available,
                                multiple: false do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
