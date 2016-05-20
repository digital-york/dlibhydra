module Dlibhydra
  class Dataset < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::SkosLabels,
            Dlibhydra::AddRdfsLabel,
            Dlibhydra::AddDcTitle,
            Dlibhydra::ValidateLabel,
            Dlibhydra::AssignId,
            Dlibhydra::DcAvailable,
            Dlibhydra::DcAccessRights

    filters_association :members, as: :dip, condition: :dip?
    filters_association :members, as: :aip, condition: :aip?

    type << ::RDF::Vocab::DCAT.Dataset

    # new term - from PURE
    property :pure_uuid, predicate: Dlibhydra::Vocab::Generic.pureUuid, multiple: false do |index|
      index.as :stored_searchable
    end

    # new term - check for existing
    # where does this come from? is it in pure?
    property :embargo_end, predicate: Dlibhydra::Vocab::Generic.embargoEnd, multiple: false do |index|
      index.as :stored_searchable
    end
    # new term - check for existing
    # ideally this will be calculated dynamically from download stats on the fly, but for now a property will do
    property :last_access, predicate: Dlibhydra::Vocab::Generic.dateOfLastAccess, multiple: false do |index|
      index.as :stored_searchable
    end

    property :index_dump, predicate: Dlibhydra::Vocab::Generic.indexDump, multiple: false do |index|
      index.as :stored_searchable
    end

  end
end