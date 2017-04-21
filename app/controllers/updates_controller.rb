class UpdatesController < ApplicationController
  def index
  end

  def show
  end

  def create
   @project = Project.find(params[:project_id])
   @update = @project.updates.new(update_params)
    if @update.save
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

