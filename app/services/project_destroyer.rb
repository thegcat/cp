class ProjectDestroyer
  attr_reader :project_store

  def initialize(project_store)
    @project_store = project_store
  end

  def process(id)
    p = @project_store.find(id)
    p.destroy
    return p
  end
end
