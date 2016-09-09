require 'rdf'
module Dlibhydra
  module Vocab
    # borthwick registers ontology
    class BorthwickRegisters < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/borthwick-registers#')
      # Class definitions
      term :SingleDate,
           label: 'Single Date'.freeze,
           comment: %(A single date, not a range.).freeze,
           'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze

      term :EntryDate,
           label: 'Entry Date'.freeze,
           comment: %().freeze,
           'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze

      term :Entry,
           label: 'Entry'.freeze,
           comment:
               %(A discreet textual entry on a document. This class has been
                devised specifically to describe the entries within an
                Archbishops' Register, but the same concept could apply to
                entries within a diary or calendar.).freeze,
           'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze

      term :Folio,
           label: 'Folio'.freeze,
           comment: %(A single folio face, or page.).freeze,
           'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze

      term :Register,
           label: 'Register'.freeze,
           comment:
               %(A Register, broadly conceived as a document containing
                entries.).freeze,
           'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze

      term :RelatedAgent,
           label: 'Related Agent'.freeze,
           subClassOf: 'http://xmlns.com/foaf/0.1/Agent'.freeze,
           comment:
               %(A person or group in the context of its relationship to another
                Object Class. This class is not intended to describe Persons
                or Groups independently.).freeze,
           'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze

      term :RelatedPlace,
           label: 'Related Place'.freeze,
           comment:
               %(A place in the context of its relationship to another Object
                Class. This class is not intended to describe Places
                independently.).freeze,
           'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze

      # Property definitions
      property :asWritten,
               label: 'As Written'.freeze,
               comment:
                   %(This property is used to capture the name of an entity as
                    it was expressed in the original resource.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               # doesn't like multiple ranges
               # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#EntryDate'.freeze,
               # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPlace'.freeze,
               # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPersonGroup'.freeze,
               domain: 'rdfs:Literal'.freeze

      property :descriptorAsWritten,
               label: 'As Written'.freeze,
               comment:
                   %(This property is a sub property of As Written and is used
                   to capture a descriptor for an Agent as expressed in the
                    original resource.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               subPropertyOf: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#descriptorAsWritten'.freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPersonGroup'.freeze,
               domain: 'rdfs:Literal'.freeze

      property :certainty,
               label: 'Certainty'.freeze,
               comment:
                   %(This property is used for the certainty of a date.
                    It is recommended that this property is used with a
                    controlled list of values.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Date'.freeze

      property :dateType,
               label: 'Date Type'.freeze,
               comment:
                   %(This property is used for the type of date, eg. birth date
                    or document date.  It is recommended that this property is
                    used with a controlled list of values.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#SingleDate'.freeze

      property :reference,
               label: 'Reference'.freeze,
               comment:
                   %(This property is used for an archival reference.).freeze,
               subPropertyOf: 'dcterms:identifier'.freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze

      property :entryNo,
               label: 'Entry Number'.freeze,
               comment:
                   %(This property is used for the entry number of a
                    given Entry.).freeze,
               subPropertyOf: 'dcterms:identifier'.freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'.freeze

      property :folioNo,
               label: 'Folio Number'.freeze,
               comment:
                   %(This property is used for the folio or page number.
                    It should be used in conjunction with Folio Type where
                    anything other than Folios numbers are being captured,
                    eg. for a membrane or page.).freeze,
               subPropertyOf: 'dcterms:identifier'.freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Folio'.freeze

      property :folioFace,
               label: 'Folio Face'.freeze,
               comment:
                   %(This property is used for the folio face. Commonly recto
                    or verso. It is recommended that this property is used with
                    a controlled list of values.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Folio'.freeze

      property :folio,
               label: 'Folio'.freeze,
               comment:
                   %(This property is used to associate an entry with the
                    folio(s) on which it appears. It's value should be a URI
                    for the Folio.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'.freeze,
               domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Folio'.freeze

      property :continuesOn,
               label: 'Continues On'.freeze,
               comment:
                   %(This property is used to indicate that the described Entry
                    continues on the given Folio. Another Entry would be created
                    to capture the continued information, related to the given
                    Folio with
                    http://dlib.york.ac.uk/ontologies/borthwick-registers#folio).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'.freeze,
               domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Folio'.freeze

      property :note,
               label: 'Note'.freeze,
               comment:
                   %(This property is used for a note specific to the
                    Object Class being described.).freeze,
               subPropertyOf: 'dcterms:description'.freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               # doesn't like multiple ranges
               # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'.freeze,
               # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#EntryDate'.freeze,
               # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPersonGroup'.freeze,
               # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPlace'.freeze,
               domain: 'rdfs:Literal'.freeze

      property :marginalia,
               label: 'Marginalia'.freeze,
               comment: %(This property is used for marginal notes.).freeze,
               subPropertyOf: 'dcterms:description'.freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'.freeze,
               domain: 'rdfs:Literal'.freeze

      property :summary,
               label: 'Summary'.freeze,
               comment:
                   %(This property is used for a brief summary of the
                    entry.).freeze,
               subPropertyOf: 'dcterms:description'.freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'.freeze,
               domain: 'rdfs:Literal'.freeze

      property :editorialNote,
               label: 'Editorial Note'.freeze,
               comment:
                   %(This property is used for editorial notes, for example
                    notes intended to inform those editing and indexing the
                    records, rather than information for the
                    general user.).freeze,
               subPropertyOf: 'dcterms:description'.freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'.freeze,
               domain: 'rdfs:Literal'.freeze

      property :entryType,
               label: 'Entry Type'.freeze,
               comment:
                   %(This property is used for the type of Entry.  .
                    It is recommended that this property is used with a
                    controlled list of values.).freeze,
               subPropertyOf: 'dcterms:description'.freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'.freeze,
               domain: 'rdfs:Literal'.freeze

      property :sectionType,
               label: 'Section Type'.freeze,
               comment:
                   %(This property is used for the section type for an Entry.
                    It is recommended that this property is used with a
                    controlled list of values.).freeze,
               subPropertyOf: 'dcterms:description'.freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'.freeze,
               domain: 'rdfs:Literal'.freeze

      property :placeType,
               label: 'Place Type'.freeze,
               comment:
                   %(This property is used for the type of Place.  .
                    It is recommended that this property is used with a
                    controlled list of values.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze

      property :role,
               label: 'Role'.freeze,
               comment:
                   %(This property is used for the role played by the
                    described Object Class.
                    It is recommended that this property is used with a
                    controlled list of values.).freeze,
               subPropertyOf: 'http://schema.org/Role'.freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze
      # doesn't like multple ranges
      # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#EntryDate'.freeze,
      # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPersonGroup'.freeze,
      # range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPlace'.freeze

      property :descriptor,
               label: 'Descriptor'.freeze,
               comment:
                   %(This property is used for the descriptor of the described
                    Agent. A descriptor might be the occupation, status or
                    other significant qualification.
                    It is recommended that this property is used with a
                    controlled list of values.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPersonGroup'.freeze

      property :isBlank,
               label: 'Is Blank'.freeze,
               comment:
                   %(This property is used to capture if the described Folio
                    is blank.
                    A true or false value is recommended.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               domain: 'rdfs:Literal'.freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Folio'.freeze

      property :isMissing,
               label: 'Is Missing'.freeze,
               comment:
                   %(This property is used to capture if a Folio should exist,
                    but is missing from the sequence.
                    A true or false value is recommended.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               domain: 'rdfs:Literal'.freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Folio'.freeze

      property :relatedAgentFor,
               label: 'Related Agent For'.freeze,
               comment:
                   %(This property creates a link from the described Agent to
                     the Object Class it is related to, for example
                    a Person related to an Entry.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'.freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPersonGroup'.freeze

      property :relatedPlaceFor,
               label: 'Related Place For'.freeze,
               comment:
                   %(This property creates a link from the described Place
                    to the Object Class it is related to, for example
                    a Place related to a Person.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               # doesn't like multiples
               # domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'.freeze,
               # domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPersonGroup'.freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#RelatedPlace'.freeze

      property :entryDateFor,
               label: 'Entry Date For'.freeze,
               comment:
                   %(This property creates a link from the described Date to the
                    Object Class it is related to, for example
                    a Date related to an Entry.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#EntryDate'.freeze,
               domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#Entry'.freeze

      property :dateFor,
               label: 'Date For'.freeze,
               comment:
                   %(This property creates a link from the described Single Date
                    to the Entry Date it is related to.).freeze,
               'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/borthwick-registers#).freeze,
               range: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#SingleDate'.freeze,
               domain: 'http://dlib.york.ac.uk/ontologies/borthwick-registers#EntryDate'.freeze

      # Extra definitions
      term :"",
           comment:
               %(Borthwick Institute for Archives
                ontology for Registers.).freeze,
           'dc:modified' => %(2016).freeze, # TODO: date
           'dc:publisher' => %(http://dlib.york.ac.uk/).freeze,
           'dc:title' => %(Borthwick Registers Ontology).freeze,
           label: 'Borthwick Registers'.freeze,
           'owl:versionInfo' => %(2016).freeze # TODO: date
    end
  end
end
