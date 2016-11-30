module Dlibhydra
  class Work < ActiveFedora::Base
    include Dlibhydra::AddWorkBehaviour

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
  end
end