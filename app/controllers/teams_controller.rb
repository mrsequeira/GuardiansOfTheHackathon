class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]
  def show
    
  end
  
  def index
    @teams = Team.all
  end
  
private
# Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end
end

