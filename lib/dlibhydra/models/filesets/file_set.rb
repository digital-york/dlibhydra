module Dlibhydra
  # dlibhydra fileset
  class FileSet < ActiveFedora::Base
    #TODO does this need to inherit from CC?
    include Hydra::Works::FileSetBehavior,
            Dlibhydra::AddLabels,
            CurationConcerns::Noid
  end
end
