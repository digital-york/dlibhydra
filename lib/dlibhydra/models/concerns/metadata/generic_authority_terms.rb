module Dlibhydra
  module GenericAuthorityTerms
    extend ActiveSupport::Concern

    included do
      property :approved, predicate: Dlibhydra::Vocab::Generic.approved, multiple: false do |index|
        index.as :stored_searchable
      end
      property :used, predicate: Dlibhydra::Vocab::Generic.used, multiple: false do |index|
        index.as :stored_searchable
      end
      property :rules, predicate: Dlibhydra::Vocab::Generic.rules, multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end