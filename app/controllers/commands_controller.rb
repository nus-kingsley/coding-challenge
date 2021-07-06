class CommandsController < ApplicationController
  def run
    @report = CommandService.new(permitted_params[:commands]).call
  rescue CommandInvalidError => e
    @error = e.message
  end

  private
  
  def permitted_params
    params.require(:commands).permit(:commands)
  end
end
