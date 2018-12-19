class ThemesController < ApplicationController
  before_action :set_team, only: [:index, :show, :update, :destroy]
  before_action :set_themes, only: [:show, :update, :destroy]
  def index
    @themes = @team.themes.all
    render json: @themes
  end
  def show
    render json: @theme

  end
  def set_team
    @team = Team.find(params[:team_id])
  end
  
  def theme_params
    params.require(:themes).permit(:id, :name_theme, :description_theme)
  end
  def set_themes
    @theme = Themes.find(params[:id])
  end
end
