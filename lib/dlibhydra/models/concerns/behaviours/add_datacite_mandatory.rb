module Dlibhydra
  module AddDataciteMandatory
    extend ActiveSupport::Concern
    include Dlibhydra::Doi,
            Dlibhydra::DcPublisher,
            Dlibhydra::DcAvailable,
            Dlibhydra::AddLabels,
            Dlibhydra::DcCreatorObject

  end
end
