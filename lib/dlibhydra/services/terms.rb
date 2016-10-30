module Dlibhydra
  module Terms
    include Qa::Authorities::WebServiceBase

    class DepartmentTerms < TermsBase
      def terms_list
        'departments'
      end
    end
  end
end