class Api::V1::ProjectsController < ApplicationController

  before_action :find_project, only: [:show]

  def create
    @project = current_user.projects.build(project_params)
    if @project.valid?
      @project.save
      render json: @project
    end
  end

  def index
    render json: current_user.projects
  end

  def show
    render json: @project
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
