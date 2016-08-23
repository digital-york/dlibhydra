module Dlibhydra

  class MainFile < ActiveFedora::Base

    include Hydra::Works::WorkBehavior,
            Dlibhydra::AddLabels,
            Dlibhydra::AssignId

    type << Dlibhydra::Vocab::Generic.MainFile

    def main?
      true
    end

  end
end
