class ProjectUpdater
  class UpdateError < StandardError; end

  attr_reader :project_store

  def initialize(project_store = nil)
    @project_store = project_store || default_project_store
  end

  def process(id, project_params)
    begin
      p = @project_store.find(id)
      p.update(project_params)
    rescue StandardError
      raise UpdateError
    end
    return p
  end

  private

  def default_project_store
    Project
  end
end
