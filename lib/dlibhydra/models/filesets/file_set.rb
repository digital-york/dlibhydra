module Dlibhydra
  # dlibhydra fileset
  class FileSet < CurationConcerns::FileSet

    include Dlibhydra::AddLabels
  
    def authority?
      false
    end
    def work?
      false
    end

  end
end
