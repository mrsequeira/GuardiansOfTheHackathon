json.extract! mentor, :id, :name_mentor, :vegan, :tshirt_size, :mentor_difficulties, :mentor_allergies, :theme_id
json.photo mentor.user.photo
json.url api_v1_mentor_url(mentor, format: :json)