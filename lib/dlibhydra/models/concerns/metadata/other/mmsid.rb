module Dlibhydra
  # mmsid
  module Mmsid
    extend ActiveSupport::Concern

    included do
      property :mmsid, predicate: Dlibhydra::Vocab::Generic.mmsid,
                           multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
