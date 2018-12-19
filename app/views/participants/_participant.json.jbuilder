json.extract! participant, :id, :name, :vegan, :tshirt_size, :motor_difficulties, :allergies, :phone, :course
json.url participant_url(participant, format: :json)