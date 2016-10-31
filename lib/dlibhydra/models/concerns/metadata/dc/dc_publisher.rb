module Dlibhydra
  # DC publisher
  module DcPublisher
    extend ActiveSupport::Concern

    included do
      # DCTERMS subject for controlled subjects.
      has_and_belongs_to_many :publisher_resource,
                              class_name: 'Dlibhydra::CurrentOrganisation',
                              predicate: ::RDF::Vocab::DC.publisher

      # DC11 for publisher name.
      property :publisher, predicate: ::RDF::Vocab::DC11.publisher,
                           multiple: false do |index|
        index.as :stored_searchable, :sortable
      end
    end
  end
end
