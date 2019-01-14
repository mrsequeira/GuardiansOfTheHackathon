class Theme < ApplicationRecord
  has_many :mentors
  has_many :team_themes
  has_many :teams, :through => :team_themes
end