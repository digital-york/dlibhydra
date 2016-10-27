module Dlibhydra
  class GenericWork < ActiveFedora::Base
    include Dlibhydra::AddWorkBehaviour,
            #Hydra::Works::WorkBehavior,
            #Dlibhydra::AssignId,
            Dlibhydra::SkosLabels,
            Dlibhydra::DcTitle,
            Dlibhydra::AddLabels

    type << ::RDF::URI.new('http://dlib.york.ac.uk/generic#GenericWork')

    def main?
      false
    end

    def generic_work?
      true
    end
  end
end
