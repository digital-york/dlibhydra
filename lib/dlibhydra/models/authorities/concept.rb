module Dlibhydra
  # concept
  class Concept < ActiveFedora::Base
    # TODO: compare to
    #   https://github.com/hybox/models/blob/master/models/concepts.md
    # TODO: add exactmatch and close match (instead of related?)

    include Hydra::Works::WorkBehavior, # TODO is this right, this isn't a work?
            Dlibhydra::AssignId,
            Dlibhydra::AddLabels,
            Dlibhydra::GenericAuthorityTerms,
            Dlibhydra::OwlSameAs,
            Dlibhydra::RdfsSeeAlso # use for external see also links

    belongs_to :concept_scheme,
               class_name: 'Dlibhydra::ConceptScheme',
               predicate: ::RDF::SKOS.inScheme
    # Use for nexted schemes
    belongs_to :top_concept_of,
               class_name: 'Dlibhydra::ConceptScheme',
               predicate: ::RDF::SKOS.topConceptOf

    type << ::RDF::URI.new('http://www.w3.org/2004/02/skos/core#Concept')

    # Use only for Broader. Narrower will be added by default as the inverse.
    has_and_belongs_to_many :broader,
                            class_name: 'Dlibhydra::Concept',
                            predicate: ::RDF::SKOS.broader,
                            inverse_of: :narrower
    has_and_belongs_to_many :narrower,
                            class_name: 'Dlibhydra::Concept',
                            predicate: ::RDF::SKOS.narrower,
                            inverse_of: :broader

    # See_also MUST NOT be the same as broader or narrower.
    # TODO: validate this.
    has_and_belongs_to_many :see_also,
                            class_name: 'Dlibhydra::Concept',
                            predicate: ::RDF::SKOS.related,
                            inverse_of: :see_also

    property :definition, predicate: ::RDF::SKOS.definition,
                          multiple: false do |index|
      index.as :stored_searchable
    end

    property :skos_note, predicate: ::RDF::SKOS.note,
                         multiple: false do |index|
      index.as :stored_searchable
    end

    def concept?
      true
    end

    def topconcept?
      if top_concept_of.is_a?(Dlibhydra::ConceptScheme)
        true
      else
        false
      end
    end
  end
end
