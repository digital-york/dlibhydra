module Dlibhydra
  # local authorities terms defined in generic vocab
  module GenericModuleCode
    extend ActiveSupport::Concern

    included do
      property :module_code, predicate: Dlibhydra::Vocab::Generic.moduleCode,
                          multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end
