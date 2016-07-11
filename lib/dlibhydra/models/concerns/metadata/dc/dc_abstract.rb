module Dlibhydra
  module DcAbstract
    extend ActiveSupport::Concern

    included do
      property :abstract, predicate: ::RDF::Vocab::DC.abstract, multiple: false do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
