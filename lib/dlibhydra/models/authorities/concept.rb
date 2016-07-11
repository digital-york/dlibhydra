module Dlibhydra
  class Concept < ActiveFedora::Base

    # cf. https://github.com/hybox/models/blob/master/models/concepts.md
    # TODO add exactmatch and close match (instead of related?)

    include Hydra::Works::WorkBehavior,
            Dlibhydra::GenericAuthorityTerms,
            Dlibhydra::OwlSameAs,
            Dlibhydra::RdfsSeeAlso, # use for external see also links
            Dlibhydra::AddLabels,
            Dlibhydra::AssignId

    belongs_to :concept_scheme, class_name: 'Dlibhydra::ConceptScheme', predicate: ::RDF::SKOS.inScheme
    belongs_to :top_concept_of, class_name: 'Dlibhydra::ConceptScheme', predicate: ::RDF::SKOS.topConceptOf

    type << ::RDF::URI.new('http://www.w3.org/2004/02/skos/core#Concept')

    # Use only for Broader. Narrower will be added by default as the inverse.
    has_and_belongs_to_many :broader, class_name: 'Dlibhydra::Concept', predicate: ::RDF::SKOS.broader, inverse_of: :narrower
    has_and_belongs_to_many :narrower, class_name: 'Dlibhydra::Concept', predicate: ::RDF::SKOS.narrower, inverse_of: :broader

    # see_also MUST NOT BE THE SAME AS NARROWER OR BROADER
    has_and_belongs_to_many :see_also, class_name: 'Dlibhydra::Concept', predicate: ::RDF::SKOS.related, inverse_of: :see_also

    property :definition, predicate: ::RDF::SKOS.definition, multiple: false do |index|
      index.as :stored_searchable
    end

    property :skos_note, predicate: ::RDF::SKOS.note, multiple: false do |index|
      index.as :stored_searchable
    end

    def concept?
      true
    end

    def topconcept?
      if self.top_concept_of.class == Dlibhydra::ConceptScheme
        true
      else
        false
      end
    end
  end
end
