# add the default depositor and default permissions for write
module Dlibhydra
  module AddDefaultPermissions
    extend ActiveSupport::Concern

    # call this from within the calling app to add a depositor
    #   if no params are included the application looks for the DLIBHYDRA['depositor'] value
    #   this requires that the dlibhydra depositor generator has been run
    included do
      def apply_depositor(dep=nil)
        if dep.nil?
          self.depositor = DLIBHYDRA['depositor']
        else
          self.depositor = dep
        end
        self.edit_users += [self.depositor]
      end
    end

  end
end