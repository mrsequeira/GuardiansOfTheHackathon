class ThemesController < ApplicationController

  	before_action :set_theme, only: [:show, :update, :destroy]
	
	# GET /themes
	def index
    	@themes = Theme.all

    	#render json: @themes
	end

	# GET /themes/1
	def show
		#render json: @theme
	end

	# POST /themes
	def create
		@theme =Theme.new(theme_params)

		if @theme.save
			render json: @theme, status: :created, location: @theme
	    else
	      render json: @theme.errors, status: :unprocessable_entity
	    end
	end

	# PUT /themes/1
	def update
		if @theme.update(theme_params)
          render json: {status: 'Sucess', message:'Saved theme', data:@theme},status: :ok
	    else
	      render json: {status: 'Error', message:'Theme not saved', data:@theme.errors},status: :unprocessable_entity
	    end
	end

	# DELETE /themes/1
	def destroy
		@theme.destroy
		render json: {status: 'Sucess', message:'Deleted theme', data:@theme},status: :ok
	end

	private
		def set_theme
			@theme = Theme.find(params[:id])
		end

		def theme_params
          params.require(:theme).permit(:name_theme, :description_theme)
        end
end