class ProjectController < ApplicationController
  def index
    @projects = Project.page(params[:page]).per(10)
  end
end
