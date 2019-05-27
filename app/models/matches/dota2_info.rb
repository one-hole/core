module Matches
  class Dota2Info < ApplicationRecord
    self.table_name = "dota2_match_infos"

    belongs_to :infoable, polymorphic: true, optional: true
  end
end