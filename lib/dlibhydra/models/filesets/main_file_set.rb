module Dlibhydra
  class MainFileSet < ActiveFedora::Base
    include Hydra::Works::FileSetBehavior,
            Dlibhydra::AddLabels

    def main?
      true
    end
  end
end
