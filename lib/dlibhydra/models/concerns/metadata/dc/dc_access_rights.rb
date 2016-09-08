module Dlibhydra
  module DcAccessRights
    extend ActiveSupport::Concern

    included do
      property :access_rights, predicate: ::RDF::Vocab::DC.accessRights, multiple: false do |index|
        index.type :text
        index.as :stored_searchable, :sortable
      end
    end
  end
end
