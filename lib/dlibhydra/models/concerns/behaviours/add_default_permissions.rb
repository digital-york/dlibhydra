module Dlibhydra
  module AddDefaultPermissions
    extend ActiveSupport::Concern

    included do
      def apply_depositor
        depositor = DLIBHYDRA['depositor']
        edit_users += self.depositor
      end
    end

  end
end