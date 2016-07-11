module Dlibhydra
  module GenericWorkflow
    extend ActiveSupport::Concern

    included do
      property :wf_status, predicate: Dlibhydra::Vocab::Generic.status, multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end