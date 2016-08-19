module Dlibhydra
  module SimpleVersions
    extend ActiveSupport::Concern

    included do

      # Versions
      has_and_belongs_to_many :is_replaced_by, class_name: 'Dlibhydra::Dataset', predicate: ::RDF::DC.isReplacedBy, inverse_of: :replaces
      has_and_belongs_to_many :replaces, class_name: 'Dlibhydra::Dataset', predicate: ::RDF::DC.replaces, inverse_of: :is_replaced_by

    end
  end
end
