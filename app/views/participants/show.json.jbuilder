json.extract! @participant, :id, :name, :vegan, :tshirt_size, :motor_difficulties, :allergies, :phone, :course
json.url participant_url(@participant, format: :json)
#
# json.participants @participants do |participant|
#   json.id participant.id
#   json.name participant.name
#   json.created_at part
# end
