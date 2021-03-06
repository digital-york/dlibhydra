module Dlibhydra
  # contemporary (current) organisation
  class CurrentOrganisation < Dlibhydra::Agent
    include Dlibhydra::FoafName,
            Dlibhydra::Pure
            # Hydra::Works::WorkBehavior - not pcdm objects or hydra works

    # TODO create preflabel

    belongs_to :concept_scheme,
               class_name: 'Dlibhydra::ConceptScheme',
               predicate: ::RDF::Vocab::SKOS.inScheme

    type [::RDF::URI.new('https://schema.org/Organization'),
         ::RDF::Vocab::FOAF.Agent,
         ::RDF::Vocab::FOAF.Organization]

    before_save :add_pure_type

    def add_pure_type
      type << Dlibhydra::Vocab::PureTerms.Organisation unless pure_uuid.nil?
    end

    def current_organisation?
      true
    end
  end
end
