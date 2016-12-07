module Dlibhydra
  # dlibhydra fileset
  class FileSet < ActiveFedora::Base
    # TODO check CC Collection Behaviour
    include Dlibhydra::AddLabels
	
    include CurationConcerns::BasicMetadata
    include Hydra::Works::FileSetBehavior
    include Hydra::Works::VirusCheck
    include CurationConcerns::FileSet::Characterization
    include Hydra::WithDepositor
    include CurationConcerns::Serializers
    include CurationConcerns::Noid
    include CurationConcerns::FileSet::Derivatives
    include CurationConcerns::Permissions
    include CurationConcerns::FileSet::Indexing
    include CurationConcerns::FileSet::BelongsToWorks
    include CurationConcerns::FileSet::Querying
    include CurationConcerns::HumanReadableType
    include CurationConcerns::RequiredMetadata
    include CurationConcerns::Naming
    include Hydra::AccessControls::Embargoable
    include GlobalID::Identification


    def authority?
      false
    end
    def work?
      false
    end
    def file_set?
      true
    end
    def collection?
      false
    end

  end
end
