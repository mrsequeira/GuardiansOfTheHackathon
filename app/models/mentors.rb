class Mentors < ApplicationRecord
    has_one :user
    has_many :themes 
  end