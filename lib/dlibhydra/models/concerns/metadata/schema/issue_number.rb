module Dlibhydra
  # Issue Number
  module IssueNumber
    extend ActiveSupport::Concern

    included do
      property :issue_number, predicate: RDF::Vocab::SCHEMA.issueNumber,
                           multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
