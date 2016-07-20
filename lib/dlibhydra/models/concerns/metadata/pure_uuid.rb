module Dlibhydra
  module PureUuid
    extend ActiveSupport::Concern

    included do
      property :pure_uuid, predicate: Dlibhydra::Vocab::PureTerms.pureUuid, multiple: false do |index|
        index.as :stored_searchable
      end
    end

  end
end
