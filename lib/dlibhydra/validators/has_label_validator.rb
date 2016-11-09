module Dlibhydra
  # validates that there is a preflabel (authorities) or title (works etc.)
class HasLabelValidator < ActiveModel::Validator
    def validate(record)
      if record.authority? and record.preflabel.nil?
        record.errors[:preflabel] << 'You must provide a preflabel for authorities'
      elsif record.title.empty?
        record.errors[:title] << 'You must provide a title'
      end
    end
  end
end
