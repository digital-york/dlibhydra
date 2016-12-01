module Dlibhydra
  # dlibhydra fileset
  class FileSet < ActiveFedora::Base
#  class FileSet < Hydra::Works::FileSet
    # include Hydra::Works::FileSetBehavior
    
	include Dlibhydra::FileSetBehavior  #,
            
#			Dlibhydra::AddLabels,
#            Dlibhydra::AssignId

    # TODO check CC Collection Behaviour
    # include Hydra::Works::FileSetBehavior,
    #         Dlibhydra::AddLabels,
    #        CurationConcerns::Noid

    def authority?
      false
    end

  end
end
