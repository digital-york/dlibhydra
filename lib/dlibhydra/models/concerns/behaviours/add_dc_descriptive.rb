module Dlibhydra
  module AddDcDescriptive
    # Add all concerns for standard descriptive dublin core metadata files
    # Note: these can be added individually to models if only select concerns are needed
    extend ActiveSupport::Concern
    include Dlibhydra::DcCreator,
      Dlibhydra::DcDate,
      Dlibhydra::DcDescription,
      Dlibhydra::DcKeywordSubject,
      Dlibhydra::DcRights,
      Dlibhydra::DcLanguage
    end
end