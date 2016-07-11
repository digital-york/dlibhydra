module Dlibhydra
  module DcResourceType
    extend ActiveSupport::Concern

    included do
      property :resource_type, predicate: ::RDF::Vocab::DC.type, multiple: true do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
