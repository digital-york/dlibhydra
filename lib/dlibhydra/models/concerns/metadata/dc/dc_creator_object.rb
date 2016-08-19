module Dlibhydra
  module DcCreatorObject
    extend ActiveSupport::Concern

    # Creator
    included do
      has_and_belongs_to_many :creator, class_name: 'Dlibhydra::CurrentPerson', predicate: ::RDF::DC.creator
    end

  end
end
