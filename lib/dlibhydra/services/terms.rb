module Dlibhydra
  module Terms
    include Qa::Authorities::WebServiceBase

    class DepartmentTerms < TermsBase
      def terms_list
        'departments'
      end
    end
    class QualificationNameTerms < TermsBase
      def terms_list
        'qualification names'
      end
    end
  end
end