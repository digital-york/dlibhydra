module Dlibhydra
  # dlibhydra fileset
  class FileSet < ActiveFedora::Base
    include Hydra::Works::FileSetBehavior,
            Dlibhydra::AddLabels,
            Dlibhydra::AssignId
  end
end
