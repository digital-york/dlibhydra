module Dlibhydra
  class Dataset < ActiveFedora::Base
    include Hydra::Works::WorkBehavior,
            Dlibhydra::AddDataciteMandatory,
            Dlibhydra::AssignId,
            Dlibhydra::DcAccessRights,
            Dlibhydra::Pure

    filters_association :members, as: :readme, condition: :readme? # FileSet for README file
    filters_association :members, as: :aips, condition: :aip?
    filters_association :members, as: :dips, condition: :dip?
    filters_association :members, as: :packages, condition: :package?

    has_and_belongs_to_many :managing_organisation, class_name: 'Dlibhydra::CurrentOrganisation', predicate: Dlibhydra::Vocab::PureTerms.pureOwner

    type << ::RDF::Vocab::DCAT.Dataset

    # new term - check for existing
    # where does this come from? is it in pure? NOT IN PUREE check ws
    property :embargo_end, predicate: Dlibhydra::Vocab::Generic.embargoEnd, multiple: false do |index|
      index.as :stored_searchable
    end
    # new term - check for existing
    # ideally this will be calculated dynamically from download stats on the fly, but for now a property will do
    property :last_access, predicate: Dlibhydra::Vocab::Generic.dateOfLastAccess, multiple: false do |index|
      index.as :stored_searchable
    end
    # make generic? and maybe call this something else!
    property :index_dump, predicate: Dlibhydra::Vocab::Generic.indexDump, multiple: false do |index|
      index.as :stored_searchable
    end

  end
end