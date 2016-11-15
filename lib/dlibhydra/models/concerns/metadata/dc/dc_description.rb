module Dlibhydra
  # DC description
  module DcDescription
    extend ActiveSupport::Concern

    included do
      property :description, predicate: ::RDF::Vocab::DC.description,
                             multiple: true do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
