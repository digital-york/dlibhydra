module Dlibhydra
  module DcTerms
    extend ActiveSupport::Concern

    included do
      # TODO move/remove format - where is it used?
      property :format, predicate: ::RDF::Vocab::DC.format, multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
