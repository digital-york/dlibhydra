module Dlibhydra
  # agents, people and organisations extend this
  class Authority < ActiveFedora::Base
    def authority?
      true
    end
    def work?
      false
    end
    def file_set?
      false
    end
    def collection?
      false
    end
  end
end
