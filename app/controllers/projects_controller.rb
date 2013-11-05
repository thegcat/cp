require "chili_project/project_creator"
require "chili_project/project_updater"
require "chili_project/project_destroyer"

class ProjectsController < ApplicationController
  respond_to :html
  represents :xml, Project
  represents :json, Project

  def new
  end

  def create
    begin
      @project = project_creation_service.process(project_params)
      flash[:notice] = t('projects.creation_successful')
    rescue ChiliProject::ProjectCreator::CreationError
      head :status => :unprocessable_entity and return
    end

    respond_with @project
  end

  def edit
    @project = Project.find(params[:id]).decorate
    respond_with @project
  end

  def update
    begin
      @project = project_update_service.process(params[:id], project_params)
      flash[:notice] = t('projects.update_successful')
    rescue ChiliProject::ProjectUpdater::UpdateError
      head status: :unprocessable_entity and return
    end

    respond_with @project
  end

  def show
    @project = Project.find(params[:id]).decorate
    respond_with @project
  end

  def index
    @projects = Project.all.decorate
    respond_with @projects
  end

  def destroy
    begin
      @project = project_destroy_service.process(params[:id])
      flash[:notice] = t('projects.destroy_successful')
    end

    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name) if params[:project].present?
  end

  def project_creation_service
    ChiliProject::ProjectCreator.new(Project)
  end

  def project_update_service
    ChiliProject::ProjectUpdater.new(Project)
  end

  def project_destroy_service
    ChiliProject::ProjectDestroyer.new(Project)
  end
end
