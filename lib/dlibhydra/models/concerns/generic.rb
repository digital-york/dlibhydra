module Dlibhydra
  module Generic
    extend ActiveSupport::Concern

    included do
      property :former_id, predicate: Dlibhydra::Vocab::Generic.formerIdentifier, multiple: true do |index|
        index.as :stored_searchable
      end
      property :approved, predicate: Dlibhydra::Vocab::Generic.approved, multiple: false do |index|
        index.as :stored_searchable
      end
      property :used, predicate: Dlibhydra::Vocab::Generic.used, multiple: false do |index|
        index.as :stored_searchable
      end
      property :rules, predicate: Dlibhydra::Vocab::Generic.rules, multiple: false do |index|
        index.as :stored_searchable
      end
      # boolean
      property :istopconcept, predicate: Dlibhydra::Vocab::Generic.isTopConcept, multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end