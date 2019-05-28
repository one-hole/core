# == Schema Information
#
# Table name: league_aliases
#
#  id        :bigint           not null, primary key
#  league_id :bigint
#  name      :string(255)      default(""), not null
#

module ArcWardens
  class LeagueAlias < ApplicationRecord
    include ArcWardenConcern
    self.table_name = "league_aliases"
  end
end
