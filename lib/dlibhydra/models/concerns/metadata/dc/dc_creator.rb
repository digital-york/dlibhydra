module Dlibhydra
  # DC creator
  module DcCreator
    extend ActiveSupport::Concern

    included do
      property :creator, predicate: ::RDF::Vocab::DC.creator,
                         multiple: true do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
