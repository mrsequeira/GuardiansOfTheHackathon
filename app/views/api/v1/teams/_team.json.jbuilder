json.extract! team, :id,:name, :project, :description, :photo
json.url api_v1_team_url(team, format: :json)
