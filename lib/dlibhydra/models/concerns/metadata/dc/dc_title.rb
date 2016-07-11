module Dlibhydra
  module DcTitle
    extend ActiveSupport::Concern

    included do
      property :title, predicate: ::RDF::Vocab::DC.title, multiple: true do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
