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
        'qualification_names'
      end
    end
    class CurrentPersonTerms < TermsService
      def terms_list
        'current_persons'
      end
    end
    class CurrentOrganisationTerms < TermsService
      def terms_list
        'current_organisations'
      end
    end
    class SubjectTerms < TermsService
      def terms_list
        'subjects'
      end
    end

    class FileTypeTerms < TermsService
      def terms_list
        'filetypes'
      end
    end
  end
end