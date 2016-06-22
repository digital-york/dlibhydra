require 'rdf'
module Dlibhydra
  module Vocab
    class PureTerms < RDF::Vocabulary('http://dlib.york.ac.uk/ontologies/pure#')

        # Class definitions
        term :PurePerson,
             comment: %(Person information from PURE).freeze,
             label: 'Pure Person'.freeze,
             'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/pure#).freeze,
             # TODO subClassOf: ''.freeze,
             type: 'rdfs:Class'.freeze
        term :PureOrganisation,
             comment: %(Organisation information from PURE.).freeze,
             label: 'Pure Organisation'.freeze,
             'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/pure#).freeze,
             # TODO subClassOf: ''.freeze,
             type: 'rdfs:Class'.freeze
        term :PurePersonPhd,
             comment: %(Person information in PURE, for a Phd student.).freeze,
             label: 'Pure Person Phd'.freeze,
             'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/pure#).freeze,
             subClassOf: 'http://dlib.york.ac.uk/ontologies/pure#PurePerson'.freeze,
             type: 'rdfs:Class'.freeze

        # Property definitions
        property :pureUuid,
                 comment: %(This property should be used to for the unique identifier for a PURE object.).freeze,
                 label: 'PURE UUID'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/pure#).freeze,
                 type: 'rdf:Property'.freeze
        property :pureCreated,
                 comment: %(This property should be used to for the date of creation in PURE.).freeze,
                 label: 'PURE Creation Date'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/pure#).freeze,
                 type: 'rdf:Property'.freeze
        property :pureDateOfProduction,
                 comment: %(This property should be used to for the date of production in PURE.).freeze,
                 label: 'PURE Creation Date'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/pure#).freeze,
                 type: 'rdf:Property'.freeze
        property :pureDateAvailable,
                 comment: %(This property should be used to for the date available in PURE.).freeze,
                 label: 'PURE Creation Date'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/pure#).freeze,
                 type: 'rdf:Property'.freeze
        property :pureType,
                 comment: %(This property should be used to for the type value in PURE,
                  eg. type of person: internal or external.).freeze,
                 label: 'PURE Creation Date'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/pure#).freeze,
                 type: 'rdf:Property'.freeze
        property :pureOrganisation,
                 comment: %(This property should be used for the managing organisation in PURE.).freeze,
                 label: 'PURE Managing Organisation'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/pure#).freeze,
                 type: 'rdf:Property'.freeze
        property :pureLink,
                 comment: %(This property should be used for an external link in PURE.).freeze,
                 label: 'PURE Link'.freeze,
                 'rdfs:isDefinedBy' => %(http://dlib.york.ac.uk/ontologies/pure#).freeze,
                 type: 'rdf:Property'.freeze

        # Extra definitions
        term :"",
             comment: %(Ontology of terms from PURE.).freeze,
             'dc:modified' => %(2016).freeze, # TODO date
             'dc:publisher' => %(http://dlib.york.ac.uk/).freeze,
             'dc:title' => %(York Digital Library PURE Ontology).freeze,
             label: 'Generic'.freeze,
             'owl:versionInfo' => %(2016).freeze # TODO date
    end
  end
end