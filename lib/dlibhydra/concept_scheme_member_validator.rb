module Dlibhydra
  class ConceptSchemeMemberValidator
    def self.validate!(_association, record)
      if !record.try(:person?) and !record.try(:place?) and !record.try(:group?) and !record.try(:concept?)
        raise ActiveFedora::AssociationTypeMismatch, "#{record} may not be a member of a concept scheme"
      end
    end
  end
end