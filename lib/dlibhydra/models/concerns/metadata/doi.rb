module Dlibhydra
  module Doi
    extend ActiveSupport::Concern

    # TODO use datacite and remove from generic vocab
    # TODO add ORCID

    included do
      property :doi, predicate: Dlibhydra::Vocab::Generic.doi, multiple: true do |index|
        index.as :stored_searchable
      end
    end

  end
end
