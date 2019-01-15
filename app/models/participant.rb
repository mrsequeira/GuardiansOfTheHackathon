class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :team


  validates :name, presence:true, length: {minimum:4, maximum:50}
  validates :tshirt_size, presence:true
  validates :motor_difficulties, length: {maximum:75}
  validates :allergies, length: {maximum:75}
  validates :phone, :numericality => true
  validates :course, length: {maximum:25}, presence:true

  #@p = Participant.new(name:"Diogo", phone:"916488198", team_id:4)

  #@p = Participant.new(name:"Diogo", tshirt_size:"M", motor_difficulties:"sou atrasado", allergies:"", phone:"916488198", course:"lei")
end
