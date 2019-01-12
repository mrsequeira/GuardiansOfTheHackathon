class TeamThemesController < ApplicationController
  before_action :set_team_theme, only: [:show, :update, :destroy]

  # GET /team_themes
  # GET /team_themes.json
  def index
    @team_themes = TeamTheme.all
  end

  # GET /team_themes/1
  # GET /team_themes/1.json
  def show
  end

  # POST /team_themes
  # POST /team_themes.json
  def create
    @team_theme = TeamTheme.new(team_theme_params)

    if @team_theme.save
      render :show, status: :created, location: @team_theme
    else
      render json: @team_theme.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /team_themes/1
  # PATCH/PUT /team_themes/1.json
  def update
    if @team_theme.update(team_theme_params)
      render :show, status: :ok, location: @team_theme
    else
      render json: @team_theme.errors, status: :unprocessable_entity
    end
  end

  # DELETE /team_themes/1
  # DELETE /team_themes/1.json
  def destroy
    @team_theme.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_theme
      @team_theme = TeamTheme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_theme_params
      params.fetch(:team_theme, {})
      # params.require(:team_theme).permit(:team_id, :themes_id, :create_at, :updated_at)

    end
end
