module Dlibhydra
  class GenericWork < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::SkosLabels,
            Dlibhydra::DcTitle,
            Dlibhydra::AddLabels,
            Dlibhydra::ValidateLabel

    type << ::RDF::URI.new('http://dlib.york.ac.uk/generic#GenericWork')

    def main?
      false
    end
    def generic_work?
      true
    end
  end
end