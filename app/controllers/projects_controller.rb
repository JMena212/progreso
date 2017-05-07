class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  
  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
    @update = @project.updates.new 
    @updates = @project.updates.where.not(id: nil).order_reverse_desc
    @categories = Update.categories.keys.map { |c| [c.humanize, c] }
  end

  def new
    @project = Project.new
    @project.contacts.build
  end

  def edit
    @project = Project.find(params[:id])
    @project.contacts.build
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
    if @project.update(project_params)
      flash[:notice] = "Project updated"
    else
      flash[:alert] = 'Error creating Project. Please try again'
    end
    redirect_to root_path
  end


  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:notice] = "Project deleted"
      redirect_to root_path
    else
      flash[:alert] = "Project was not deleted"
      render :show
    end
  end

  private
  def project_params
   params.require(:project).permit(:title, :body,
     contacts_attributes: [:id, :name, :number, :_destroy])
  end
  
end
