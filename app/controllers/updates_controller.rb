class UpdatesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  
  def index
  end

  def show
   @project = Project.find(params[:project_id])
   @update = @project.updates.find(params[:id])
  end

  def create
   @project = Project.find(params[:project_id])
   @update = @project.updates.new(update_params)
   @update.user = current_user
    if @update.save
     SendUpdateTextJob.perform_later(@project, @update, params[:contact])
     flash[:notice] = 'update added'
    else
     flash[:alert] = 'update failed to save'
    end
    redirect_to @project
  end
  
#new action is handled in the project controller

  def edit
  end
  
  
  private
  def update_params
   params.require(:update).permit(:category, :body, :image)
  end
  
  
  
end

