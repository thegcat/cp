require 'representable/xml/collection'
require 'representable/json/collection'

module ProjectsRepresenter
  include Representable::XML::Collection
  include Representable::JSON::Collection

  self.representation_wrap = :projects

  items extend: ProjectRepresenter
end
