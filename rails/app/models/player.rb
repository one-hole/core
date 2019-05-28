# == Schema Information
#
# Table name: players
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  abbr       :string(255)
#  avatar     :string(255)
#  team_id    :bigint
#  offical_id :bigint
#

# 选手
# HLTV 的  Live 里面会有选手数据
# Dota2 的 Live 里面会有选手数据

class Player < ApplicationRecord

  belongs_to :current_team, class_name: 'Team', foreign_key: :team_id
  has_many :player_teams
  has_many :teams, through: :player_teams

end
