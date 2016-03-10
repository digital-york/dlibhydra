class Dataset < ActiveFedora::Base
  include Hydra::Works::WorkBehavior

  filters_association :members, as: :dip, condition: :dip?
  filters_association :members, as: :additionals, condition: :additional?

  # type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')

  # from PURE
  property :title, predicate: ::RDF::Vocab::DC.title, multiple: false do |index|
    index.as :stored_searchable
  end

  # new term
  # from PURE
  property :pure_uuid, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/generic#pureUuid'), multiple: false do |index|
    index.as :stored_searchable
  end

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

  # new term - check for existing
  # automatic
  property :embargo_end, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/generic#embargoEnd'), multiple: false do |index|
    index.as :stored_searchable
  end
  # new term - check for existing
  property :last_access, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/generic#dateOfLastAccess'), multiple: false do |index|
    index.as :stored_searchable
  end

  def dip?
    false
  end
end