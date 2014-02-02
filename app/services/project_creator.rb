class ProjectCreator
  class CreationError < StandardError; end

  attr_reader :project_store

  def initialize(project_store)
    @project_store = project_store || default_project_store
  end

  def process(project_params)
    begin
      p = @project_store.create(project_params)
    rescue StandardError
      raise CreationError
    end
    return p
  end

  private

  def default_project_store
    Project
  end
end
