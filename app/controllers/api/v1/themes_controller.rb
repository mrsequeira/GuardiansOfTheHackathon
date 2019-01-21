module Api
  module V1
		class ThemesController < ApplicationController
			
	before_action :apipie_validations

	before_action :set_theme, only: [:show, :update, :destroy]
		
	resource_description do
		short 'Documentation APIpie for model participants'
		description 'This api its build to project called Guardians of Hackton to subject called Engenharia Software oriented by Renato Panda'
		formats ['json']
		# param :id, Fixnum, :desc => "Participant ID", :required => true
		error 404, "Missing"
		error 500, "Server crashed"
		error :unprocessable_entity, "Could not save the entity."
		returns :code => 403 do
				property :reason, String, :desc => "Why this was forbidden"
		end
		deprecated false
	end

	def_param_group :theme do
		param :id, Integer, :desc => "Theme ID"
		param :name_theme, String, :desc => "Name of Theme"
		param :description_theme, String, :desc => "Description of Theme"
	end
	
	# GET /themes
	api :GET, '/api/v1/themes' , 'Get all themes'
  param_group :theme
	def index
    	@themes = Theme.all

    	#render json: @themes
	end

	# GET /themes/
	api :GET, 'api/v1//themes/:id', 'Get Theme'
  param_group :theme
	def show
		#render json: @theme
	end

	# POST /themes
	api :POST, 'api/v1/themes', 'Create a new theme'
  param_group :theme
	def create
		@theme =Theme.new(theme_params)

		if @theme.save
			render json: @theme, status: :created, location: @theme
	    else
	      render json: @theme.errors, status: :unprocessable_entity
	    end
	end

	# PUT /themes/1
	api :PUT, 'api/v1/themes/:id' , 'Update a theme'
  param_group :theme
	def update
		if @theme.update(theme_params)
          render json: {status: 'Sucess', message:'Saved theme', data:@theme},status: :ok
	    else
	      render json: {status: 'Error', message:'Theme not saved', data:@theme.errors},status: :unprocessable_entity
	    end
	end

	# DELETE /themes/1
	api :DELETE, 'api/v1/themes/:id' , 'Delete a new theme'
  param_group :theme
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

    end
end