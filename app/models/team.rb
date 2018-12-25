class Team < ApplicationRecord

    has_many :participants
    has_many :team_themes
    has_many :themes, :through => :team_themes

    validates :name, presence:true, length: {minimum:4, maximum:20}
    validates :project, presence:true, length: {minimum:4, maximum:15}
    validates :description, presence:true, length: {minimum:4, maximum:50}

end
