module Dlibhydra
  # contemporary (current) organisation
  class CurrentOrganisation < ActiveFedora::Base
    include Dlibhydra::OwlSameAs,
            Dlibhydra::AddLabels,
            Dlibhydra::FoafName,
            Dlibhydra::Pure,
            CurationConcerns::Noid
            # Hydra::Works::WorkBehavior - not pcdm objects or hydra works

    # belongs_to :concept_scheme,
    #   class_name: 'Dlibhydra::ConceptScheme', predicate: ::RDF::Vocab::SKOS.inScheme

    type [::RDF::URI.new('https://schema.org/Organization')]
    before_save :add_pure_type

    def add_pure_type
      type << Dlibhydra::Vocab::PureTerms.Organisation unless pure_uuid.nil?
    end

    def current_organisation?
      true
    end
  end
end
