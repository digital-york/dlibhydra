module Dlibhydra
  # FIXME: is this needed?
  # DC resource type
  module DcResourceType
    extend ActiveSupport::Concern

    included do
      property :resource_type, predicate: ::RDF::Vocab::DC.type,
                               multiple: true do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
