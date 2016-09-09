module Dlibhydra
  # add standard descriptive dublin core metadata
  module AddDcDescriptive
    extend ActiveSupport::Concern
    include Dlibhydra::DcCreator,
            Dlibhydra::DcDate,
            Dlibhydra::DcDescription,
            Dlibhydra::DcKeywordSubject,
            Dlibhydra::DcRights,
            Dlibhydra::DcLanguage
  end
end
