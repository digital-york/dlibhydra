module Dlibhydra
  module Pure
    extend ActiveSupport::Concern

    included do
      #if self.class.name.include? 'Dataset'
      has_and_belongs_to_many :managing_organisation, class_name: 'Dlibhydra::CurrentOrganisation', predicate: Dlibhydra::Vocab::PureTerms.pureManagingUnit
      #end
      property :pure_uuid, predicate: Dlibhydra::Vocab::PureTerms.pureUuid, multiple: false do |index|
        index.as :stored_searchable
      end
      property :pure_creation, predicate: Dlibhydra::Vocab::PureTerms.pureCreation, multiple: false do |index|
        index.as :stored_searchable, :stored_sortable
        index.type :date
      end
      property :pure_type, predicate: Dlibhydra::Vocab::PureTerms.pureType, multiple: false do |index|
        index.as :stored_searchable
      end
      # TODO does this need to be pure only?
      property :pure_link, predicate: Dlibhydra::Vocab::PureTerms.pureLink, multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
