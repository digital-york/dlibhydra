module Dlibhydra
  # dlibhydra fileset
  class FileSet < ActiveFedora::Base
    include Dlibhydra::FileSetBehavior,
            Dlibhydra::AddLabels,
            Dlibhydra::AssignId

puts 'within Dlibhydra::FileSet'

  end
end
