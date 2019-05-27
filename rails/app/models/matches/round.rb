# 这里用来记录 CSGO 小回合的数据

module Matches
  class Round < ApplicationRecord
    self.table_name = "csgo_rounds"
  end
end