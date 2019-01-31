module ArcWardens
  class LeagueAlias < ApplicationRecord
    include ArcWardenConcern
    self.table_name = "league_aliases"
  end
end