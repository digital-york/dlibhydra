module Dlibhydra
  # thesis
  class Thesis < ActiveFedora::Base

    include Dlibhydra::AddWorkBehaviour,
            # Hydra::Works::WorkBehavior,
            # Dlibhydra::AssignId,
            Dlibhydra::AddLabels,
            Dlibhydra::AddDcDescriptive,
            Dlibhydra::DcRights,
            Dlibhydra::DcAbstract,
            Dlibhydra::Doi,
            Dlibhydra::FormerIdentifier,
            Dlibhydra::Orcid,
            Dlibhydra::MainFile,
            Dlibhydra::ThesisMetadata

    type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')

    def thesis?
      true
    end
  end
end
