module Dlibhydra
  # DC keyword and subject
  module DcKeywordSubject
    extend ActiveSupport::Concern

    included do
      # DC11 for free keywords.
      property :keyword, predicate: ::RDF::Vocab::DC11.subject,
                         multiple: true do |index|
        index.as :stored_searchable
      end
      # DCTERMS subject for controlled subjects.
      property :subject, predicate: ::RDF::Vocab::DC.subject,
                         multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
