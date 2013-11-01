module ChiliProject
  class ProjectCreator
    class CreationError < StandardError; end

    attr_reader :project_store

    def initialize(project_store)
      @project_store = project_store
    end

    def process(project_params)
      begin
        @project_store.create(project_params)
      rescue StandardError
        raise CreationError
      end
    end
  end
end
