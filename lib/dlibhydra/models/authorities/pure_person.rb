module Dlibhydra
  class PurePerson < ActiveFedora::Base

    include Hydra::Works::WorkBehavior,
            Dlibhydra::OwlSameAs,
            Dlibhydra::AddLabels,
            Dlibhydra::FoafNameParts,
            Dlibhydra::Pure,
            Dlibhydra::AssignId

    #belongs_to :concept_scheme, class_name: 'Dlibhydra::ConceptScheme', predicate: ::RDF::SKOS.inScheme

    type << ::RDF::URI.new('http://schema.org/Person')
    type << Dlibhydra::Vocab::PureTerms.PurePerson

    def pure_person?
      true
    end
    def is_phd
      type << Dlibhydra::Vocab::PureTerms.PurePersonPhd
    end
  end
end