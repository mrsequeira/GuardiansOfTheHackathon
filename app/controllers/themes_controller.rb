class ThemesController < ApplicationController

  def index
    @themes = Themes.all

    render json: @themes
  end
end
