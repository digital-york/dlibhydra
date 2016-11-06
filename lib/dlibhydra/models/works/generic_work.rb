module Dlibhydra
  class GenericWork < ActiveFedora::Base
    include Dlibhydra::AddWorkBehaviour,
            Dlibhydra::AddDcDescriptive,
            Dlibhydra::AddLabels

    type << ::RDF::URI.new('http://dlib.york.ac.uk/generic#GenericWork')

    def generic_work?
      true
    end
  end
end
