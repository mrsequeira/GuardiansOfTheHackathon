class Theme < ApplicationRecord
  has_many :mentors
  has_many :team_themes
  has_many :mentors, :through => :team_themes
end