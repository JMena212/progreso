class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end



  def create
    @project = current_user.projects.new(project_params)
      if @project.save
       flash[:notice] = "Project was saved successfully."
       redirect_to root_path
      else
       flash.now[:alert] = "Error creating Project. Please try again."
       render :new
      end
  end


  def update
     @project = Project.find(params[:id])
    if @project.update(wiki_params)
      flash[:notice] = "Project updated"
    else
      flash[:alert] = 'Error creating Project. Please try again'
    end
    redirect_to root_path
  end


  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:notice] = "Wiki Removed"
      redirect_to root_path
    else
      flash[:alert] = "Wiki not removed"
      render :show
    end
  end

  private
  def project_params
   params.require(:project).permit(:title, :body)
  end
  
end
