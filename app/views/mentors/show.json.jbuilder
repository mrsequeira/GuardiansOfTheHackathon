json.extract! @mentor, :id, :name_mentor, :vegan, :tshirt_size, :mentor_difficulties, :mentor_allergies, :theme_id
json.url mentor_url(@mentor, format: :json)
#
# json.mentors @mentors do |mentor|
#   json.id mentor.id
#   json.name mentor.name_mentor
#   json.created_at part
# end