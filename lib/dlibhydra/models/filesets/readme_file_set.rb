module Dlibhydra
  class ReadmeFileSet < ActiveFedora::Base
    include Hydra::Works::FileSetBehavior,
            Dlibhydra::SkosLabels,
            Dlibhydra::AddRdfsLabel,
            Dlibhydra::AddDcTitle,
            Dlibhydra::ValidateLabel,
            Dlibhydra::AssignId


    def readme?
      true
    end
    def aip?
      false
    end

  end
end