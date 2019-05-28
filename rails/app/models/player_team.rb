# == Schema Information
#
# Table name: player_teams
#
#  id        :bigint           not null, primary key
#  player_id :bigint
#  team_id   :bigint
#  at        :datetime
#  action    :integer          default(0)
#

# 队员和选手的中间表
# Action (join & leave & at)
class PlayerTeam < ApplicationRecord
  # enum actions: {
  #   existence: 0, 
  #   join:      1,
  #   leave:     2
  # }

  belongs_to :team
  belongs_to :player
end
