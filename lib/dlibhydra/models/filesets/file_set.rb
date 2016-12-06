module Dlibhydra
  # dlibhydra fileset
  class FileSet < ActiveFedora::Base
    include Hydra::Works::FileSetBehavior,
            Dlibhydra::AddLabels,
			Dlibhydra::Derivatives,
            CurationConcerns::Noid
  
    def authority?
      false
    end
    def work?
      false
    end

  end
end
