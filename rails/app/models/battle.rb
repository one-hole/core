# == Schema Information
#
# Table name: battles
#
#  id            :bigint           not null, primary key
#  game_id       :integer
#  left_team_id  :bigint
#  right_team_id :bigint
#  start_time    :datetime
#  offical_id    :bigint
#  league_id     :bigint
#  status        :integer
#  left_score    :integer          default(0)
#  right_score   :integer          default(0)
#  format        :integer
#  game_no       :integer          default(0)
#  live          :boolean          default(FALSE)
#

# 系列赛
class Battle < ApplicationRecord

  enum status: {
    canceled:  -1,
    pending:   0,
    ongoing:   1,
    finished:  2
  }

  belongs_to :left_team
  belongs_to :right_team
  belongs_to :league

  has_many :matches

end
