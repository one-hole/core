# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  game_id    :bigint
#  name       :string(255)      default("")
#  abbr       :string(255)      default("")
#  logo       :string(255)      default("")
#  offical_id :bigint
#  country    :string(255)
#  region     :string(255)
#  operated   :boolean          default(FALSE)
#  oh_id      :integer
#

class Team < ApplicationRecord
  include BasicConcern
  
  belongs_to :game
  has_many :aliases, foreign_key: :team_id, class_name: 'TeamAlias'
  has_many :player_teams
  has_many :players, through: :player_teams
end
