module Dlibhydra
  class Work < ActiveFedora::Base
    include Dlibhydra::AddWorkBehaviour,
            Dlibhydra::AddDefaultPermissions
    
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