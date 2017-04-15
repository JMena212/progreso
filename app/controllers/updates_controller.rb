class UpdatesController < ApplicationController
  def index
  end

  def show
  end

  def create
   @project = Project.find(params[:id])
   @update = @project.updates.new(update_params)
    if @update.save
     flash[:notice] 'update added'
    else
     flash[:alert] 'update failed to save'
    end
  end
  
#new action is handled in the project controller

  def edit
  end
end
