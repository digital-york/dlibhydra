module Dlibhydra
  # DC creator
  module DcCreator
    extend ActiveSupport::Concern

    included do

      has_and_belongs_to_many :creator_resource,
                              predicate: ::RDF::Vocab::DC.creator,
                              class_name: 'Dlibhydra::Agent'

      property :creator_string, predicate: ::RDF::Vocab::DC11.creator,
               multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
    end
  end
end
