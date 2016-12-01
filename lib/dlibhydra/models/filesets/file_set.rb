module Dlibhydra
  # dlibhydra fileset
  class FileSet < ActiveFedora::Base
#  class FileSet < Hydra::Works::FileSet
    # include Hydra::Works::FileSetBehavior
puts 'Loading FileSet...'    
	
	include Dlibhydra::FileSetBehavior  

    def authority?
      false
    end

  end
end
