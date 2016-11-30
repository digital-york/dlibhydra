module Dlibhydra
  # DC abstract
  module DcAbstract
    extend ActiveSupport::Concern

    included do
      property :abstract, predicate: ::RDF::Vocab::DC.abstract,
                          multiple: true do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
