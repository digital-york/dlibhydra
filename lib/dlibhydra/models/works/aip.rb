class Aip < ActiveFedora::Base
  include Hydra::Works::WorkBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::AddRdfsLabel,
          Dlibhydra::AddDcTitle,
          Dlibhydra::ValidateLabel

  # TODO relationship to dip
  has_and_belongs_to_many :has_dip, class_name: 'Dlibhydra::Dip', predicate: ::RDF::SKOS.narrower, inverse_of: :has_aip

  type << ::RDF::URI.new('http://dlib.york.ac.uk/generic#ArchivalInformtionPackage')

  # new term
  # from Archivematica
  property :sip_uuid, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/generic#sipUuid'), multiple: false do |index|
    index.as :stored_searchable
  end

  # new term
  # from Archivematica
  property :aip_uuid, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/generic#aipUuid'), multiple: false do |index|
    index.as :stored_searchable
  end

  # new term
  property :data_status, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/generic#dataStatus'), multiple: false do |index|
    index.as :stored_searchable
  end

  def aip?
    true
  end
  def dip?
    false
  end

end