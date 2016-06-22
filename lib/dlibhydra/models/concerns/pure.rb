module Dlibhydra
  module Pure
    extend ActiveSupport::Concern

    included do
      property :pure_uuid, predicate: Dlibhydra::Vocab::PureTerms.pureUuid, multiple: false do |index|
        index.as :stored_searchable
      end
      property :pure_creation, predicate: Dlibhydra::Vocab::PureTerms.pureCreation, multiple: false do |index|
        index.as :stored_searchable
      end
      property :pure_creation, predicate: Dlibhydra::Vocab::PureTerms.pureCreation, multiple: false do |index|
        index.as :stored_searchable
      end
      property :pure_date_of_production, predicate: Dlibhydra::Vocab::PureTerms.pureDateOfProduction, multiple: false do |index|
        index.as :stored_searchable
      end
      property :pure_date_available, predicate: Dlibhydra::Vocab::PureTerms.pureDateAvailable, multiple: false do |index|
        index.as :stored_searchable
      end
      property :pure_type, predicate: Dlibhydra::Vocab::PureTerms.pureType, multiple: false do |index|
        index.as :stored_searchable
      end
      property :pure_link, predicate: Dlibhydra::Vocab::PureTerms.pureLink, multiple: true do |index|
        index.as :stored_searchable
      end
    end

  end
end
