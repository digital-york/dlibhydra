module Dlibhydra

  class MainFile < ActiveFedora::Base

    include Dlibhydra::AddLabels,
            Dlibhydra::AssignId

    self.human_readable_type = 'Main File'

    type << Dlibhydra::Vocab::Generic.MainFile

    def main?
      true
    end

  end
end
