module Dlibhydra
  # simple version handling
  module SimpleVersions
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :replaced_by,
                              class_name: self.name,
                              predicate: ::RDF::Vocab::DC.isReplacedBy,
                              inverse_of: :replaces
      has_and_belongs_to_many :replaces,
                              class_name: self.name,
                              predicate: ::RDF::Vocab::DC.replaces,
                              inverse_of: :replaced_by

    end
  end
end
