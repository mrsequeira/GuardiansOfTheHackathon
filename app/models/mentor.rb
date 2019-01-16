class Mentor < ApplicationRecord
    has_one :user
    belongs_to :theme

    validates :name_mentor, presence:true, length: {minimum:4, maximum:50}
    validates :tshirt_size, presence:true, length:{minimum:1, maximum:2}
    validates :mentor_difficulties, length: {maximum:50}
    validates :mentor_allergies, length: {maximum:50}
    validates :theme_id, presence:true, length: {minimum:1, maximum:50}
end
