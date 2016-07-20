module Dlibhydra
  class CurrentOrganisation < ActiveFedora::Base

    include Hydra::Works::WorkBehavior,
            Dlibhydra::OwlSameAs,
            Dlibhydra::AddLabels,
            Dlibhydra::FoafName,
            Dlibhydra::PureUuid,
            Dlibhydra::AssignId

    #belongs_to :concept_scheme, class_name: 'Dlibhydra::ConceptScheme', predicate: ::RDF::SKOS.inScheme

    type << ::RDF::URI.new('https://schema.org/Organization')
    before_save :add_pure_type

    def add_pure_type
      unless self.pure_uuid.nil?
        type << Dlibhydra::Vocab::PureTerms.Organisation
      end
    end

    def current_organisation?
      true
    end
  end
end