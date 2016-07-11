module Dlibhydra
  module DcDate
    extend ActiveSupport::Concern

    included do
      property :date, predicate: ::RDF::Vocab::DC.date, multiple: true do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
