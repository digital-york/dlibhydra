module Dlibhydra
  module Rights
    extend ActiveSupport::Concern

    included do
      # same as cc:attributionName
      property :rights_holder, predicate: ::RDF::Vocab::DC.rightsHolder, multiple: false do |index|
        index.as :stored_searchable
      end

      # same as cc:license
      property :license, predicate: ::RDF::Vocab::DC.license, multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end
