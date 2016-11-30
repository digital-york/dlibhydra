module Dlibhydra
  # RDF type
  module RdfType
    extend ActiveSupport::Concern

    # Use this where additional types are added in callbacks
    included do
      property :rdf_type, predicate: ::RDF::RDFV.type, multiple: true
    end
  end
end