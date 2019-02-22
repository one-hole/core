# == Schema Information
#
# Table name: battles
#
#  id            :bigint(8)        not null, primary key
#  game_id       :integer
#  left_team_id  :bigint(8)
#  right_team_id :bigint(8)
#  start_time    :datetime
#  offical_id    :bigint(8)
#  league_id     :bigint(8)
#  status        :integer
#  left_score    :integer          default(0)
#  right_score   :integer          default(0)
#  format        :integer
#  game_no       :integer          default(0)
#  live          :boolean          default(FALSE)
#

# 系列赛
class Battle < ApplicationRecord
end
