module Dlibhydra
  module FoafNameParts
    extend ActiveSupport::Concern

    included do
      # eg. NCA Rules 2.4
      property :family, predicate: ::RDF::Vocab::FOAF.familyName, multiple: false do |index|
        index.as :stored_searchable
      end

      # eg. NCA Rules 2.3
      property :given_name, predicate: ::RDF::FOAF.givenName, multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end