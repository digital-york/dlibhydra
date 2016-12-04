module Dlibhydra
  # validates that there is a preflabel (authorities) or title (works etc.)
  # For FileSets, title and/or preflabel are optional
  class HasLabelValidator < ActiveModel::Validator
    def validate(record)
      if record.authority? and record.preflabel.nil?
        record.errors[:preflabel] << 'You must provide a preflabel for authorities'
      elsif !record.authority? and record.title.empty? and !record.fileset?
        record.errors[:title] << 'You must provide a title'
      end
    end
  end
end
