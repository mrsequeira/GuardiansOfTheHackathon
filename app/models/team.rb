class Team < ApplicationRecord

    has_many :participants
    has_many :team_themes
    has_many :themes, :through => :team_themes
end
