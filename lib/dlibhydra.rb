require 'dlibhydra/version'

module Dlibhydra
  extend ActiveSupport::Autoload

  module Vocab
    extend ActiveSupport::Autoload
    eager_autoload do
      autoload :Generic
      autoload :BorthwickRegisters
      autoload :OaisArchivematica
      autoload :PureTerms
      autoload :Uketd
      autoload :LocalResourceTerms
    end
  end

  autoload_under 'vocab/concerns' do
    autoload :BorthwickClasses
    autoload :BorthwickProperties
  end

  autoload_under 'services' do
    autoload :Terms
    autoload :TermsService
    autoload :SolrQuery
  end

  autoload_under 'models' do
    autoload :Work
    autoload :Authority
  end

  autoload_under 'models/authorities' do
    autoload :Concept
    autoload :ConceptScheme
    autoload :Place
    autoload :Agent
  end
  autoload_under 'models/authorities/agents' do
    autoload :Group
    autoload :Person
    autoload :CurrentPerson
    autoload :CurrentOrganisation
  end

  autoload_under 'models/collections' do
    autoload :Collection # TODO refactor
  end
  autoload_under 'models/filesets' do
    autoload :FileSet
  end
  autoload_under 'models/works' do
    autoload :Package
    autoload :Dataset
    autoload :ExamPaper
    autoload :GenericWork # TODO refactor
    autoload :Thesis
  end

  autoload_under 'models/works/entry' do
  end

  autoload_under 'models/concerns/metadata/other' do
    # Metadata
    autoload :Archivematica
    autoload :BorthwickNote
    autoload :Department
    autoload :Doi
    autoload :FoafName
    autoload :FoafNameParts
    autoload :ForIndexing
    autoload :FormerIdentifier
    autoload :GenericAuthorityTerms
    autoload :GenericModuleCode
    autoload :GenericQualifier
    autoload :GenericWorkflow
    autoload :HubDates
    autoload :LastAccess
    autoload :MadsRelatedAuthority
    autoload :MainFile
    autoload :Orcid
    autoload :OwlSameAs
    autoload :Pure
    autoload :Qualification
    autoload :ReadmeFile
    autoload :SkosLabels
    autoload :SimpleVersions
    autoload :ThesisMetadata
    # autoload :ThumbnailUrl TODO remove once standard approach for thumbnail is in place
  end

  autoload_under 'models/concerns/metadata/add_metadata' do
    autoload :AddLabels
    autoload :AddDcDescriptive
    autoload :AddDataciteMandatory
    autoload :AddDatasetMetadata
    autoload :AddPackageMetadata
    autoload :AddExamPaperMetadata
    autoload :AddThesisMetadata
  end

  autoload_under 'models/concerns/metadata/dc' do
    # Dublin Core Metadata
    autoload :DcAbstract
    autoload :DcAccessRights
    autoload :DcAvailable
    autoload :DcCreator
    autoload :DcDate
    autoload :DcDescription
    autoload :DcIdentifier
    autoload :DcKeywordSubject
    autoload :DcLanguage
    autoload :DcPublisher
    autoload :DcResourceType
    autoload :DcRights
    autoload :DcTitle
  end

  autoload_under 'models/concerns/metadata/rdf' do
    # RDF and RDFS
    autoload :RdfsSeeAlso
    autoload :RdfsLabel
    autoload :RdfType
  end

  autoload_under 'models/concerns/behaviours' do
    # Behaviour
    autoload :AddWorkBehaviour
    # Validations
    autoload :ValidateConceptScheme
    autoload :ValidateLabel
  end

  autoload_under 'validators' do
    autoload :HasLabelValidator
    autoload :ConceptSchemeMemberValidator
  end
end
