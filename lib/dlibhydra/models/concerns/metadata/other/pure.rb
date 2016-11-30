module Dlibhydra
  # PURE metadata
  module Pure
    extend ActiveSupport::Concern

    included do
      property :pure_uuid,
               predicate: Dlibhydra::Vocab::PureTerms.pureUuid,
               multiple: false do |index|
        index.as :stored_searchable
      end
      property :pure_creation,
               predicate: Dlibhydra::Vocab::PureTerms.pureCreation,
               multiple: false do |index|
        index.as :stored_searchable, :stored_sortable
      end
      property :pure_type,
               predicate: Dlibhydra::Vocab::PureTerms.pureType,
               multiple: true do |index|
        index.as :stored_searchable
      end
      # TODO: does this need to be pure only?
      property :pure_link,
               predicate: Dlibhydra::Vocab::PureTerms.pureLink,
               multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
