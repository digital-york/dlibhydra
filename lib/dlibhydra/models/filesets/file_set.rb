module Dlibhydra
  class FileSet < ActiveFedora::Base
    include Hydra::Works::FileSetBehavior,
            Dlibhydra::AddLabels

    def main?
      false
    end
    def generic_work?
      false
    end
  end
end
