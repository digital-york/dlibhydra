module Dlibhydra
  # agents, people and organisations extend this
  class Agent < Authority
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
