class ProjectsController < ApplicationController
  respond_to :html
  represents :xml, Project
  represents :json, Project

  def new
    # form_for does some magic if we pass it an empty AR object as opposed
    # to just telling it we're working on a :project. That works for now, but
    # we probably don't want to keep this here.
    @project = Project.new
  end

  def create
    begin
      @project = project_creation_service.process(project_params)
      flash[:notice] = t('projects.creation_successful')
    rescue ProjectCreator::CreationError
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
    rescue ProjectUpdater::UpdateError
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
    ProjectCreator.new
  end

  def project_update_service
    ProjectUpdater.new
  end

  def project_destroy_service
    ProjectDestroyer.new
  end
end
