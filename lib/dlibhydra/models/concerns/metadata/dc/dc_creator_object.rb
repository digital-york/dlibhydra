module Dlibhydra
  # DC creator as related object
  module DcCreatorObject
    extend ActiveSupport::Concern

    # TODO extend indexer to add preflabel for name
    # TODO use DcCreator for all cases

    included do
      has_and_belongs_to_many :creator,
                              class_name: 'Dlibhydra::CurrentPerson',
                              predicate: ::RDF::DC.creator
    end
  end
end
