# == Schema Information
#
# Table name: matches
#
#  id        :bigint           not null, primary key
#  battle_id :bigint
#  start_at  :datetime
#  end_at    :datetime
#  reverse   :boolean          default(FALSE)
#  type      :string(255)
#

# 小局比赛

# 这里有一些默认的处理前提：
# CSGO：
#   left_team : CT， reverse: false : 如果 reverse: true, 那么 right_team : CT
  
class Match < ApplicationRecord
  enum states: {
    unstart:  0,
    ongoing:  1,
    finished: 2
  }

  belongs_to :battle, optional: true

  has_many :player_matches
  has_many :players, through: :player_matches
end
