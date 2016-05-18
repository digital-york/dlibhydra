class Dip < ActiveFedora::Base
  include Hydra::Works::WorkBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::AddRdfsLabel,
          Dlibhydra::AddDcTitle,
          Dlibhydra::ValidateLabel

  # TODO relationship to aip; non membership relationship
  has_and_belongs_to_many :aip, class_name: 'Dlibhydra::Aip', predicate: ::RDF::SKOS.narrower, inverse_of: :dip

  filters_association :members, as: :data, condition: :data?

  # type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')

  # new term
  property :data_status, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/generic#dataStatus'), multiple: false do |index|
    index.as :stored_searchable
  end

  def dip?
    true
  end
  def aip?
    false
  end

end