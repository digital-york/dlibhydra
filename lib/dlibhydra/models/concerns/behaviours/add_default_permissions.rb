module Dlibhydra
  module AddDefaultPermissions
    extend ActiveSupport::Concern

    included do
      def depositor
        DLIBHYDRA['depositor']
      end

      def apply_depositor
        self.edit_users += self.depositor        #
      end
    end

  end
end