module Dlibhydra

  class ReadmeFile < ActiveFedora::Base

    include Dlibhydra::AddLabels,
            Dlibhydra::AssignId

    self.human_readable_type = 'Readme File'

    type << Dlibhydra::Vocab::Generic.Readme

    def readme?
      true
    end

  end
end
