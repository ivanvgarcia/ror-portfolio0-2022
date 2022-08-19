class ProjectsController < ApplicationController
  load_and_authorize_resource except: [:index, :show]

  def index
    @projects = Project.page(params[:page]).per(10)
  end


  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit; end

  def destroy
    @project.destroy

    redirect_to projects_path
  end

  def project_params
    params.require(:project).permit(:name, :body, :image)
  end
end
