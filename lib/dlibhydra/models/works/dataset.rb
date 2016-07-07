module Dlibhydra
  class Dataset < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::SkosLabels,
            Dlibhydra::AddRdfsLabel,
            Dlibhydra::AddDcTitle,
            Dlibhydra::ValidateLabel,
            Dlibhydra::AssignId,
            Dlibhydra::DcAvailable,
            Dlibhydra::DcAccessRights,
            Dlibhydra::Pure,
            Dlibhydra::Doi

    filters_association :members, as: :dip, condition: :readme? # FileSet for README file TODO validate
    filters_association :members, as: :aip, condition: :aip?

    has_and_belongs_to_many :creator, class_name: 'Dlibhydra::PurePerson', predicate: ::RDF::DC.creator
    has_and_belongs_to_many :managing_organisation, class_name: 'Dlibhydra::PureOrganisation', predicate: Dlibhydra::Vocab::PureTerms.pureOrganisation

    type << ::RDF::Vocab::DCAT.Dataset

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