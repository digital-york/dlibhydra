module Dlibhydra
  class Concept < ActiveFedora::Base

    # cf. https://github.com/hybox/models/blob/master/models/concepts.md
    # TODO add exactmatch and close match (instead of related?)

    require 'hydra/works'
    include Hydra::Works::WorkBehavior,
            Dlibhydra::GenericAuthorityTerms,
            Dlibhydra::SameAs,
            Dlibhydra::SkosLabels
            # Dlibhydra::DcTerms
            # Dlibhydra::RdfType,
            # Dlibhydra::AssignRdfTypes
            # Dlibhydra::AssignId

    belongs_to :concept_scheme, class_name: 'Dlibhydra::ConceptScheme', predicate: ::RDF::SKOS.inScheme

    type << ::RDF::URI.new('http://www.w3.org/2004/02/skos/core#Concept')

    # Use only for Broader. Narrower will be added by default as the inverse.
    has_and_belongs_to_many :broader, class_name: 'Dlibhydra::Concept', predicate: ::RDF::SKOS.broader, inverse_of: :narrower
    has_and_belongs_to_many :narrower, class_name: 'Dlibhydra::Concept', predicate: ::RDF::SKOS.narrower, inverse_of: :broader

    property :definition, predicate: ::RDF::SKOS.definition, multiple: false do |index|
      index.as :stored_searchable
    end

    property :skos_note, predicate: ::RDF::SKOS.note, multiple: false do |index|
      index.as :stored_searchable
    end

    property :see_also, predicate: ::RDF::SKOS.related, multiple: true do |index|
      index.as :stored_searchable
    end

    # Use boolean
    property :istopconcept, predicate: Dlibhydra::Vocab::Generic.isTopConcept, multiple: false do |index|
      index.as :stored_searchable
    end

    def concept?
      true
    end

    def topconcept?
      if self.istopconcept
        true
      else
        false
      end
    end
  end
end
