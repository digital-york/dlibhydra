module Dlibhydra
  # add mandatory datacite elements
  module AddDataciteMandatory
    extend ActiveSupport::Concern
    include Dlibhydra::Doi,
            Dlibhydra::DcPublisher,
            Dlibhydra::DcAvailable,
            Dlibhydra::AddLabels,
            Dlibhydra::DcCreator #Object
  end
end
