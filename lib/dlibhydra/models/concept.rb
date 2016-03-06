module Dlibhydra
  class Concept < ActiveFedora::Base

    include Dlibhydra::RdfType #,Dlibhydra::Generic,Dlibhydra::SameAs,Dlibhydra::SkosLabels,Dlibhydra::DCTerms,Dlibhydra::AssignId,Dlibhydra::AssignRdfTypes

    belongs_to :concept_scheme, class_name: 'ConceptScheme', predicate: ::RDF::SKOS.inScheme

    # Use only for Broader, Narrower will be added by default
    #has_and_belongs_to_many :broader, class_name: 'Concept', predicate: ::RDF::SKOS.broader, inverse_of: :narrower
    #has_and_belongs_to_many :narrower, class_name: 'Concept', predicate: ::RDF::SKOS.narrower, inverse_of: :broader

    property :definition, predicate: ::RDF::SKOS.definition, multiple: false do |index|
      index.as :stored_searchable
    end

    property :see_also, predicate: ::RDF::SKOS.related, multiple: true do |index|
      index.as :stored_searchable
    end

    # there is more skos we could add ...

  end
end
