module Dlibhydra
  class GenericWork < Work
    include Dlibhydra::AddDcDescriptive,
            Dlibhydra::AddLabels

    type << ::RDF::URI.new('http://dlib.york.ac.uk/generic#GenericWork')

    def generic_work?
      true
    end
  end
end
