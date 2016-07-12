module Dlibhydra
  module HubDates
    extend ActiveSupport::Concern

    included do
      # eg. NCA Rules 4.4
      # eg. NCA Rules 2.5A
      property :dates, predicate: ::RDF::URI.new('http://data.archiveshub.ac.uk/def/dates'), multiple: false do |index|
        index.as :stored_searchable
      end
    end
  end
end