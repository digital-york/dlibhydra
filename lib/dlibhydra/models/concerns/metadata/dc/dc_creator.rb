module Dlibhydra
  # DC creator
  module DcCreator
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :creator_resource,
                              class_name: 'Dlibhydra::CurrentPerson',
                              predicate: ::RDF::Vocab::DC.creator

      property :creator, predicate: ::RDF::Vocab::DC11.creator,
               multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
    end
  end
end
