module Dlibhydra
  class Dataset < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::SkosLabels,
            Dlibhydra::AddRdfsLabel,
            Dlibhydra::AddDcTitle,
            Dlibhydra::ValidateLabel#,
            #Dlibhydra::AssignId

    filters_association :members, as: :dip, condition: :dip?
    filters_association :members, as: :aip, condition: :aip?

    type << ::RDF::DCAT.Dataset

    # new term - from PURE
    property :pure_uuid, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/generic#pureUuid'), multiple: false do |index|
      index.as :stored_searchable
    end

    # new term - check for existing
    # where does this come from? is it in pure?
    property :embargo_end, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/generic#embargoEnd'), multiple: false do |index|
      index.as :stored_searchable
    end
    # new term - check for existing
    # ideally this will be calculated dynamically from download stats on the fly, but for now a property will do
    property :last_access, predicate: ::RDF::URI.new('http://dlib.york.ac.uk/ontologies/generic#dateOfLastAccess'), multiple: false do |index|
      index.as :stored_searchable
    end

  end
end