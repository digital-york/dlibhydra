module Dlibhydra
  module BorthwickNote
    extend ActiveSupport::Concern

    included do
      property :note, predicate: Dlibhydra::Vocab::BorthwickRegisters.note, multiple: true do |index|
        index.as :stored_searchable
      end
    end
  end
end