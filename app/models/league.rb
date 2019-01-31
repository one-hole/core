class League < ApplicationRecord
  include BasicConcern

  has_many :aliases, foreign_key: :league_id, class_name: 'LeagueAlias'
end
