module ChiliProject
  class ProjectCreator
    attr_reader :project_store

    def initialize(project_store)
      @project_store = project_store
    end

    def process(project_params)
      @project_store.create(project_params)
    end
  end
end
