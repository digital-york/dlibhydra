module Dlibhydra
  # contemporary (current) person
  class CurrentPerson < Dlibhydra::Agent
    include Dlibhydra::FoafNameParts,
            Dlibhydra::Pure,
            Dlibhydra::RdfType,
            Dlibhydra::Orcid
            # Hydra::Works::WorkBehavior - not pcdm objects or hydra works

    # TODO create preflabel

    before_save :add_pure_type

    belongs_to :concept_scheme,
               class_name: 'Dlibhydra::ConceptScheme',
               predicate: ::RDF::Vocab::SKOS.inScheme

    type [::RDF::URI.new('http://schema.org/Person'),
          ::RDF::Vocab::FOAF.Agent,
          ::RDF::Vocab::FOAF.Person]

    def add_pure_type
      rdf_type << Dlibhydra::Vocab::PureTerms.Person unless pure_uuid.nil?
    end

    def current_person?
      true
    end

    def phd
      rdf_type << Dlibhydra::Vocab::PureTerms.PhdStudent
    end
  end
end
