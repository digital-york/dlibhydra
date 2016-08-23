module Dlibhydra

  class ReadmeFile < ActiveFedora::Base

    include Hydra::Works::WorkBehavior,
            Dlibhydra::AddLabels,
            Dlibhydra::AssignId

    type << Dlibhydra::Vocab::Generic.Readme

    def readme?
      true
    end

  end
end
