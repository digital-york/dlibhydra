class Dataset < ActiveFedora::Base
  include Hydra::Works::WorkBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::AddRdfsLabel,
          Dlibhydra::AddDcTitle,
          Dlibhydra::ValidateLabel

  filters_association :members, as: :dip, condition: :dip?
  filters_association :members, as: :aip, condition: :aip?

  # type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')

  # new term
  # from PURE
  property :pure_uuid, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/generic#pureUuid'), multiple: false do |index|
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

end