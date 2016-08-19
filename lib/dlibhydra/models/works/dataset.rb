module Dlibhydra
  class Dataset < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::AddDataciteMandatory,
            Dlibhydra::AssignId,
            Dlibhydra::ForIndexing,
            Dlibhydra::DcAccessRights,
            Dlibhydra::Pure

    filters_association :members, as: :readme, condition: :readme? # FileSet for README file
    filters_association :members, as: :aips, condition: :aip?
    filters_association :members, as: :dips, condition: :dip?
    filters_association :members, as: :packages, condition: :package?

    type << ::RDF::Vocab::DCAT.Dataset

    # look at how CC handles this
    # where does this come from? is it in pure? NOT IN PUREE check ws
    property :embargo_release_date, predicate: Dlibhydra::Vocab::Generic.embargoReleaseDate, multiple: false do |index|
      index.as :stored_searchable
    end
    property :retention_policy, predicate: Dlibhydra::Vocab::Generic.retentionPolicy, multiple: false do |index|
      index.as :stored_searchable
    end

    def dataset?
      true
    end

  end
end