module Dlibhydra
  class ReadmeFileSet < ActiveFedora::Base
    include Hydra::Works::FileSetBehavior,
            Dlibhydra::AddLabels

    def readme?
      true
    end
    def aip?
      false
    end
    def dip?
      false
    end

  end
end