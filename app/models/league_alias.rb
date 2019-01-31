class LeagueAlias < ApplicationRecord
  include BasicConcern
  belongs_to :league
end
