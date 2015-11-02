class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    check_syntax(@project, project_params)

    if @project.save
      flash[:success] = 'Project was successfully created.'
      redirect_to @project
    else
      render :new
    end
  end

  def update
    check_syntax(@project, project_params)
    if @project.update(project_params)
      flash[:success] = 'Project was successfully updated.'
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:success] = 'Project was successfully destroyed.'
    redirect_to projects_url
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def check_syntax(project, params)
      Project.validate_and_compile(project, params)
    end

    def project_params
      params.require(:project).permit(:name, :slim, :sass, :coffeescript, :compliled_html, :compiled_css, :compiled_js)
    end
end
