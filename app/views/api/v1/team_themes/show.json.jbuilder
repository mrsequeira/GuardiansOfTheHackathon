json.extract! @team_theme, :id, :team_id, :theme_id, :created_at, :updated_at
json.url api_v1_team_theme_url(@team_theme, format: :json)