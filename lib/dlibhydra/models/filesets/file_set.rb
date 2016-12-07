module Dlibhydra
  # dlibhydra fileset
  class FileSet < ActiveFedora::Base
    # TODO check CC Collection Behaviour
    include Hydra::Works::FileSetBehavior,
            Dlibhydra::AddLabels,
            CurationConcerns::Noid,
			CurationConcerns::Permissions,
			CurationConcerns::FileSet::Derivatives

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
