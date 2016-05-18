require 'rdf'
module Dlibhydra
  module Vocab
    class Generic < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/generic#')

        # Class definitions
        term :OrderedCollection,
             comment: %(A collection with members that has a logical order.).freeze,
             label: 'Ordered Collection'.freeze,
             'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/generic#).freeze,
             # TODO subClassOf: ''.freeze,
             type: 'rdfs:Class'.freeze

        term :DisseminationInformationPackage,
             comment: %(A dissemination information package, as defined by the Reference Model for an Open Archival Information System (OAIS).).freeze,
             label: 'Dissemination Information Package (DIP)'.freeze,
             'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/generic#).freeze,
             # TODO subClassOf: ''.freeze,
             type: 'rdfs:Class'.freeze

        term :ArchivalInformationPackage,
             comment: %(An archival information package, as defined by the Reference Model for an Open Archival Information System (OAIS).).freeze,
             label: 'Archival Information Package (AIP)'.freeze,
             'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/generic#).freeze,
             # TODO subClassOf: ''.freeze,
             type: 'rdfs:Class'.freeze

        term :SubmissionInformationPackage,
             comment: %(A submission information package, as defined by the Reference Model for an Open Archival Information System (OAIS).).freeze,
             label: 'Submission Information Package (SIP)'.freeze,
             'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/generic#).freeze,
             # TODO subClassOf: ''.freeze,
             type: 'rdfs:Class'.freeze

        term :GenericWork,
             comment: %(A work that does not fit into any pre-existing model, eg. an unidentified data file.).freeze,
             label: 'Archival Information Package (AIP)'.freeze,
             'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/generic#).freeze,
             # TODO subClassOf: ''.freeze,
             type: 'rdfs:Class'.freeze

        # Property definitions
        property :approved,
                 comment: %(This property is used to indicate that a term or value has been approved.).freeze,
                 label: 'Approved'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/generic#).freeze,
                 type: 'rdf:Property'.freeze
        property :rules,
                 comment: %(This property is used to the rule, eg. cataloguing or descriptive rules, used to construct the given description.).freeze,
                 label: 'Rules'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/generic#).freeze,
                 type: 'rdf:Property'.freeze
        property :formerIdentifier,
                 comment: %(This property is used for a former identifier for the given object.).freeze,
                 label: 'Former Identifier'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/generic#).freeze,
                 subPropertyOf: 'http://dublincore.org/documents/dcmi-terms/identifier'.freeze,
                 type: 'rdf:Property'.freeze
        property :preTitle,
                 comment: %(This property should be used as designated in the NCA Rules http://archiveshub.ac.uk/ncarules/.).freeze,
                 label: 'Pre Title'.freeze,
                 range: 'http://xmlns.com/foaf/0.1/Person'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/generic#).freeze,
                 type: 'rdf:Property'.freeze
        property :datesOfOffice,
                 comment: %(This property should be used for the dates of office for the described Person.).freeze,
                 label: 'Dates of Office'.freeze,
                 range: 'http://xmlns.com/foaf/0.1/Person'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/generic#).freeze,
                 subPropertyOf: 'http://data.archiveshub.ac.uk/def/dates'.freeze,
                 type: 'rdf:Property'.freeze
        property :groupType,
                 comment: %(This property is used for the type of Group. It is recommended that this property is used with a controlled list of values.).freeze,
                 label: 'Group Type'.freeze,
                 range: 'http://xmlns.com/foaf/0.1/Group'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/generic#).freeze,
                 type: 'rdf:Property'.freeze
        property :qualifier,
                 comment: %(This property should be used to qualify the name of a Group, Organisation or Corporate Body, for examples with dates of existence or place.).freeze,
                 label: 'Qualifier'.freeze,
                 range: 'http://xmlns.com/foaf/0.1/Group'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/generic#).freeze,
                 type: 'rdf:Property'.freeze
        property :isTopConcept,
                 comment: %(This property is used to indicate that the described Concept is at the top of the hierarchy. A value of true or false is recommended.).freeze,
                 label: 'Is Top Concept'.freeze,
                 range: 'http://www.w3.org/2004/02/skos/core#Concept'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/generic#).freeze,
                 type: 'rdf:Property'.freeze

        # Extra definitions
        term :"",
             comment: %(General purpose ontology for York Digital Library.).freeze,
             'dc:modified' => %(2016).freeze, # TODO date
             'dc:publisher' => %(http://dlib.york.ac.uk/).freeze,
             'dc:title' => %(York Digital Library Generic Ontology).freeze,
             label: 'Generic'.freeze,
             'owl:versionInfo' => %(2016).freeze # TODO date
    end
  end
end