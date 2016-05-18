class Data < ActiveFedora::Base
  include Hydra::Works::WorkBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::AddRdfsLabel,
          Dlibhydra::AddDcTitle,
          Dlibhydra::ValidateLabel

  filters_association :members, as: :data, condition: :data?

  # type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')

end