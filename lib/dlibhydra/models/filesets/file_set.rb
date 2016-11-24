module Dlibhydra
  # dlibhydra fileset
  class FileSet < ActiveFedora::Base
    include CurationConcerns::FileSetBehavior,
            Dlibhydra::AddLabels

    def authority?
      false
    end
    def work?
      false
    end
    def file_set?
      true
    end
    def collection?
      false
    end

  end
end
