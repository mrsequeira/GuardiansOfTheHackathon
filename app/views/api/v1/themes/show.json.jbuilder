json.extract! @theme, :id, :name_theme, :description_theme
json.url api_v1_theme_url(@theme, format: :json)