module Dlibhydra
  class PureOrganisation < ActiveFedora::Base

    include Hydra::Works::WorkBehavior,
            Dlibhydra::SameAs,
            Dlibhydra::SkosLabels,
            Dlibhydra::DcTitle,
            Dlibhydra::AddLabels,
            Dlibhydra::ValidateLabel,
            Dlibhydra::Pure,
            Dlibhydra::AssignId

    #belongs_to :concept_scheme, class_name: 'Dlibhydra::ConceptScheme', predicate: ::RDF::SKOS.inScheme

    type << ::RDF::URI.new('https://schema.org/Organization')
    type << Dlibhydra::Vocab::PureTerms.PureOrganisation
    # something locaion

    property :name, predicate: ::RDF::Vocab::FOAF.name, multiple: false do |index|
      index.as :stored_searchable
    end

    def pure_organisation?
      true
    end
  end
end