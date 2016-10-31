module Dlibhydra
  module Terms
    include Qa::Authorities::WebServiceBase

    # Sub-set of Current Organisations
    class DepartmentTerms < TermsService
      def terms_list
        'departments'
      end
    end
    class QualificationNameTerms < TermsService
      def terms_list
        'qualification names'
      end
    end
    class CurrentPersonTerms < TermsService
      def terms_list
        'current persons'
      end
    end
    class CurrentOrganisationTerms < TermsService
      def terms_list
        'current organisations'
      end
    end
  end
end