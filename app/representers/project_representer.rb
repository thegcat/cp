module ProjectRepresenter
  include Roar::Representer::XML
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  self.representation_wrap = :project

  property :id
  property :name

  link :self do
    project_url(represented)
  end
end
