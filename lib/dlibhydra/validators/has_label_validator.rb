# validates that there is a preflabel
module Dlibhydra
  class HasLabelValidator < ActiveModel::Validator
    def validate(record)
      if record.preflabel.empty? or record.preflabel.nil?
        record.errors[:preflabel] << "You must provide a preflabel"
      end
    end
  end
end