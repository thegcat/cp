require "chili_project/project_creator"

class ProjectsController < ApplicationController
  def create
    begin
      project = project_creation_service.process(project_params)
    rescue ChiliProject::ProjectCreator::CreationError
      head :status => :unprocessable_entity and return
    end

    redirect_to project_path(project), notice: :project_creation_successful
  end

  private

  def project_params
    params.require(:project).permit(:name) if params[:project].present?
  end

  def project_creation_service
    ChiliProject::ProjectCreator.new(Project)
  end
end
