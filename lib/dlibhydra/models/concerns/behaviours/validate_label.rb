module Dlibhydra
  module ValidateLabel
    extend ActiveSupport::Concern

    included do
      validates_with Dlibhydra::HasLabelValidator
    end

  end
end

