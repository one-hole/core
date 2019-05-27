# == Schema Information
#
# Table name: teams
#
#  id         :bigint(8)        not null, primary key
#  game_id    :bigint(8)
#  name       :string(255)      default("")
#  abbr       :string(255)      default("")
#  logo       :string(255)      default("")
#  offical_id :bigint(8)
#  country    :string(255)
#  region     :string(255)
#  operated   :boolean          default(FALSE)
#  aw_id      :integer
#

class Team < ApplicationRecord
  include BasicConcern
  
  belongs_to :game
  has_many :aliases, foreign_key: :team_id, class_name: 'TeamAlias'
end
