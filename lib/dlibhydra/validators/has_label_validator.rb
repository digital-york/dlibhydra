# validates that there is a preflabel
module Dlibhydra
  class HasLabelValidator < ActiveModel::Validator
    def validate(record)
      # TODO reinstate or remove
      # if record.preflabel.empty? and record.title.empty?
      #   record.errors[:preflabel] << 'You must provide a preflabel or a title'
      # end
    end
  end
end
