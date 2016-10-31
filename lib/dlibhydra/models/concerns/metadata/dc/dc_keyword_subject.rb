module Dlibhydra
  # DC keyword and subject
  module DcKeywordSubject
    extend ActiveSupport::Concern

    included do
      # DCTERMS subject for controlled subjects.
      has_and_belongs_to_many :subject_resource,
                              class_name: 'Dlibhydra::Concept',
                              predicate: ::RDF::Vocab::DC.subject

      # DC11 for free keywords.
      property :keyword, predicate: ::RDF::Vocab::DC11.subject,
                         multiple: true do |index|
        index.as :stored_searchable
      end
      # property :subject, predicate: ::RDF::Vocab::DC.subject,
      #                    multiple: true do |index|
      #   index.as :stored_searchable, :facetable
      # end
    end
  end
end
