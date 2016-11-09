module Dlibhydra
  # agent, people and organisations extend this
  class Agent < ActiveFedora::Base
    include Dlibhydra::OwlSameAs,
            Dlibhydra::AddLabels,
            Dlibhydra::GenericAuthorityTerms,
            Dlibhydra::MadsRelatedAuthority,
            CurationConcerns::Noid

    def agent?
      true
    end
  end
end