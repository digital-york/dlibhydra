class Dip < ActiveFedora::Base
  include Hydra::Works::WorkBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::AddRdfsLabel,
          Dlibhydra::AddDcTitle,
          Dlibhydra::ValidateLabel

  has_and_belongs_to_many :has_aip, class_name: 'Dlibhydra::Aip', predicate: ::RDF::SKOS.narrower, inverse_of: :has_dip

  type << ::RDF::URI.new('http://dlib.york.ac.uk/generic#DisseminationInformtionPackage')

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