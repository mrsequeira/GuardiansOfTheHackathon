json.extract! participant, :id, :name, :vegan, :tshirt_size, :motor_difficulties, :allergies, :phone, :course
json.photo participant.user.photo
json.url api_v1_participant_url(participant, format: :json)