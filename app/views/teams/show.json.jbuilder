json.extract! @team, :id, :name, :project, :description, :photo, :created_at, :updated_at
json.url team_url(@team, format: :json)