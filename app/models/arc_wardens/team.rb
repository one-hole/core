module ArcWardens
  class Team < ApplicationRecord
    include ArcWardenConcern
    self.table_name = "teams"
  end
end