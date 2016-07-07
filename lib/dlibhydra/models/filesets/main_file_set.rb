module Dlibhydra
  class MainFileSet < ActiveFedora::Base
    include Hydra::Works::FileSetBehavior


    # We only need to extend FileSet where we have a local requirement. In this case we want to be able to call:
    # .mains to provide a list of only the main files associated with a thesis or exam paper

    def main?
      true
    end
  end
end
