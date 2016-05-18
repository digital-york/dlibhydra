class GenericWork < ActiveFedora::Base
  include Hydra::Works::WorkBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::AddRdfsLabel,
          Dlibhydra::AddDcTitle,
          Dlibhydra::ValidateLabel

  type << ::RDF::URI.new('http://dlib.york.ac.uk/generic#GenericWork')

end