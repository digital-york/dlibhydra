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
    end
  end

  autoload_under 'models/authorities' do
    autoload :Concept
    autoload :ConceptScheme
    autoload :Group
    autoload :Person
    autoload :Place
    autoload :CurrentPerson
    autoload :CurrentOrganisation
  end

  autoload_under 'models/collections' do
    autoload :Collection # TODO refactor
  end

  autoload_under 'models/filesets' do
    autoload :FileSet
    # Removed due to incompatibility with CC
    # autoload :MainFileSet   # Removed due to incompatibility with CC
    # autoload :ReadmeFileSet  # Removed due to incompatibility with CC
  end

  autoload_under 'models/works' do
    autoload :Package
    autoload :Dataset
    autoload :GenericWork # TODO refactor
    autoload :Thesis
  end

  autoload_under 'models/works/entry' do
  end

  autoload_under 'models/concerns/metadata' do
    # Metadata
    autoload :Archivematica
    autoload :BorthwickNote
    autoload :Doi
    autoload :FoafName
    autoload :FoafNameParts
    autoload :ForIndexing
    autoload :FormerIdentifier
    autoload :GenericAuthorityTerms
    autoload :GenericQualifier
    autoload :GenericWorkflow
    autoload :HubDates
    autoload :LastAccess
    autoload :MadsRelatedAuthority
    autoload :MainFile
    autoload :Orcid
    autoload :OwlSameAs
    autoload :Pure
    autoload :Readme
    autoload :SkosLabels
    autoload :SimpleVersions
    autoload :ThesisMetadata
    # autoload :ThumbnailUrl TODO remove once standard approach for thumbnail is in place
  end

  autoload_under 'models/concerns/metadata/rdfs' do
    # RDF and RDFS
    autoload :RdfsSeeAlso
    autoload :RdfsLabel
  end

  autoload_under 'models/concerns/metadata/dc' do
    # Dublin Core Metadata
    autoload :DcAbstract
    autoload :DcAccessRights
    autoload :DcAvailable
    autoload :DcCreator
    autoload :DcCreatorObject
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

  autoload_under 'models/concerns/behaviours' do
    # Identifiers
    autoload :AssignId
    # Behaviour
    autoload :AddLabels
    autoload :AddDcDescriptive
    autoload :AddDataciteMandatory
    # Validations
    autoload :ValidateConceptScheme
    # autoload :ValidateLabel
  end

  autoload_under 'validators' do
    # autoload :HasLabelValidator
    autoload :ConceptSchemeMemberValidator
  end
end
