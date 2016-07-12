module Dlibhydra
  class PureOrganisation < ActiveFedora::Base

    include Hydra::Works::WorkBehavior,
            Dlibhydra::OwlSameAs,
            Dlibhydra::AddLabels,
            Dlibhydra::FoafName,
            Dlibhydra::Pure,
            Dlibhydra::AssignId

    #belongs_to :concept_scheme, class_name: 'Dlibhydra::ConceptScheme', predicate: ::RDF::SKOS.inScheme

    type << ::RDF::URI.new('https://schema.org/Organization')
    type << Dlibhydra::Vocab::PureTerms.PureOrganisation

    def pure_organisation?
      true
    end
  end
end