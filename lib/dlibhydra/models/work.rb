module Dlibhydra
  class Work < ActiveFedora::Base
    include Dlibhydra::AddWorkBehaviour,
            Dlibhydra::AddDefaultPermissions

    has_and_belongs_to_many :packaged_by,
                            class_name: 'Dlibhydra::Package',
                            predicate: Dlibhydra::Vocab::Generic.packagedBy,
                            inverse_of: :packages

    def authority?
      false
    end
    def work?
      true
    end
    def file_set?
      false
    end
    def collection?
      false
    end
    def edit_groups
      ['admin']
    end

  end
end