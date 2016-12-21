module Dlibhydra
  # common metadata for all
  module CommonMetadata
    extend ActiveSupport::Concern

      # Common dc properties
      include Dlibhydra::DcTitle
      include Dlibhydra::DcCreator
      include Dlibhydra::DcDate
      include Dlibhydra::DcDescription
      include Dlibhydra::DcPublisher
      include Dlibhydra::DcKeywordSubject
      include Dlibhydra::DcRights

      # Common dlib properties
      include Dlibhydra::FormerIdentifier
    
  end
end
