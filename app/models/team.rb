class Team < ApplicationRecord
  include BasicConcern
  
  belongs_to :game
  has_many :aliases, foreign_key: :team_id, class_name: 'TeamAlias'
end
