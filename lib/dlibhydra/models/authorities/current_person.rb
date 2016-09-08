module Dlibhydra
  # contemporary (current) person
  class CurrentPerson < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::OwlSameAs,
            Dlibhydra::AddLabels,
            Dlibhydra::FoafNameParts,
            Dlibhydra::Pure,
            Dlibhydra::Orcid,
            Dlibhydra::AssignId

    before_save :add_pure_type

    # belongs_to :concept_scheme,
    #   class_name: 'Dlibhydra::ConceptScheme', predicate: ::RDF::SKOS.inScheme

    type << ::RDF::URI.new('http://schema.org/Person')

    def add_pure_type
      type << Dlibhydra::Vocab::PureTerms.Person unless pure_uuid.nil?
    end

    def current_person?
      true
    end

    def phd
      type << Dlibhydra::Vocab::PureTerms.Phd
    end
  end
end
