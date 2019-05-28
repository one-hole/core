# == Schema Information
#
# Table name: csgo_rounds
#
#  id            :bigint           not null, primary key
#  match_info_id :bigint
#  index         :integer          default(0)
#  result        :boolean
#  reason        :integer          default(0)
#  duration      :integer
#

# 这里用来记录 CSGO 小回合的数据

module Matches
  class Round < ApplicationRecord
    self.table_name = "csgo_rounds"
  end
end
