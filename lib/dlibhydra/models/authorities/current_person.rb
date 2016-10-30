module Dlibhydra
  # contemporary (current) person
  class CurrentPerson < ActiveFedora::Base
    include Dlibhydra::OwlSameAs,
            Dlibhydra::AddLabels,
            Dlibhydra::FoafNameParts,
            Dlibhydra::Pure,
            Dlibhydra::RdfType,
            Dlibhydra::Orcid,
            CurationConcerns::Noid
            # Hydra::Works::WorkBehavior - not pcdm objects or hydra works

    before_save :add_pure_type

    # belongs_to :concept_scheme,
    #   class_name: 'Dlibhydra::ConceptScheme', predicate: ::RDF::Vocab::SKOS.inScheme

    type [::RDF::URI.new('http://schema.org/Person')]

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
