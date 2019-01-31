module ArcWardens
  class League < ApplicationRecord
    include ArcWardenConcern
    self.table_name = :leagues
    self.inheritance_column = :_type_disabled

    has_many :league_aliases, foreign_key: :league_id

    def self.migrate
      self.includes(:league_aliases).each do |aw_league|
        new_league = ::League.find_or_create_by(
          id:          aw_league.id,
          aw_id:       aw_league.id,
          game_id:     aw_league.game_id,
          logo:        aw_league.logo,
          second_logo: aw_league.secondary_logo,
          offical_id:  aw_league.extern_id,
          name:        aw_league.name,
          status:      aw_league.status,
          start_time:  aw_league.start_time,
          end_time:    aw_league.end_time,
          hidden:      aw_league.hidden
        )

        aw_league.league_aliases.each do |ali|
          new_league.aliases.find_or_create_by(name: ali.alias_name)
        end
      end
    end
  end
end