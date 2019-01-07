class Themes < ApplicationRecord
  validates :name_theme, presence: true
  validates :description_theme, presence: true
  has_many :mentors
  has_many :team_themes
  has_many :mentors, :through => :team_themes
end