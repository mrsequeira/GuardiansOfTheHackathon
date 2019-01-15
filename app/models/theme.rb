class Theme < ApplicationRecord
  has_many :mentors
  has_many :team_themes
  has_many :teams, :through => :team_themes

    validates :name_theme, presence:true, length: {minimum:4, maximum:15}
    validates :description_theme, presence:true, length: {minimum:4, maximum:200}
end
