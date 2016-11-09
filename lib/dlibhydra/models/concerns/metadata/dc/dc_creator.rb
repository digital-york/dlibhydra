module Dlibhydra
  # DC creator
  module DcCreator
    extend ActiveSupport::Concern

    included do

      has_and_belongs_to_many :creator_resource,
                              predicate: ::RDF::Vocab::DC.creator,
                              # TODO define an agents class for all of the person / org classes to inherit from
                              class_name: 'Dlibhydra::Agent' # 'Dlibhydra::CurrentPerson' || 'Dlibhydra::CurrentOrganisation'

      property :creator, predicate: ::RDF::Vocab::DC11.creator,
               multiple: true do |index|
        index.as :stored_searchable, :sortable, :facetable
      end
    end
  end
end
