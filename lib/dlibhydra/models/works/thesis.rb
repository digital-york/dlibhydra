class Thesis < ActiveFedora::Base
  include Hydra::Works::WorkBehavior,
          Dlibhydra::SkosLabels,
          Dlibhydra::AddRdfsLabel,
          Dlibhydra::AddDcTitle,
          Dlibhydra::ValidateLabel,
          Dlibhydra::DcKeywordSubject,
          Dlibhydra::DcRights

  # distinguish the main file
  filters_association :members, as: :main, condition: :main?

  type << ::RDF::URI.new('http://purl.org/ontology/bibo/Thesis')

  # preflabel is mandatory (via concern), dc.title and rdfs:label automatically added

  # would this be a URI? could it be author identifier, eg. ORCID
  property :author, predicate: ::RDF::Vocab::DC.creator, multiple: false do |index|
    index.as :stored_searchable
  end

  property :abstract, predicate: ::RDF::Vocab::DC.abstract, multiple: false do |index|
    index.as :stored_searchable
  end

  property :date_of_award, predicate: ::RDF::Vocab::DC.issued, multiple: false do |index|
    index.as :stored_searchable
  end

  property :advisor, predicate: Dlibhydra::Vocab::Uketd.advisor, multiple: true do |index|
    index.as :stored_searchable
  end

  property :department, predicate: Dlibhydra::Vocab::Uketd.department, multiple: true do |index|
    index.as :stored_searchable
  end

  # same as http://naca.central.cranfield.ac.uk/ethos-oai/terms/institution and bibo:issuer
  property :awarding_institution, predicate: ::RDF::Vocab::Bibframe.dissertationInstitution, multiple: false do |index|
    index.as :stored_searchable
  end

  property :qualification_level, predicate: Dlibhydra::Vocab::Uketd.qualificationlevel, multiple: false do |index|
    index.as :stored_searchable
  end

  # same as http://naca.central.cranfield.ac.uk/ethos-oai/terms/qualificationname
  property :qualification_name, predicate: ::RDF::URI.new('http://vivoweb.org/ontology/core#AcademicDegree'), multiple: false do |index|
    index.as :stored_searchable
  end

  property :resource_type, predicate: ::RDF::Vocab::DC.type, multiple: false do |index|
    index.as :stored_searchable
  end

  property :language, predicate: ::RDF::Vocab::DC.language, multiple: false do |index|
    index.as :stored_searchable
  end

  def main?
    false
  end

end
