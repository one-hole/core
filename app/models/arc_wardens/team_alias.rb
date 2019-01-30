module ArcWardens
  class TeamAlias < ApplicationRecord
    include ArcWardenConcern
    self.table_name = "team_aliases"

  end
end