module Dlibhydra
  # DC access rights
  module DcAccessRights
    extend ActiveSupport::Concern

    included do
      # there is an access_rights property in CC, hence the dc_
      property :dc_access_rights, predicate: ::RDF::Vocab::DC.accessRights,
                               multiple: false do |index|
        index.as :stored_searchable
        # a sortable text solr index (*_tesi) will also be added by
        #   bespoke code in models/works/dataset.rb
      end
    end
  end
end
