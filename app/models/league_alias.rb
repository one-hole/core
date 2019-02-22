# == Schema Information
#
# Table name: league_aliases
#
#  id        :bigint(8)        not null, primary key
#  league_id :bigint(8)
#  name      :string(255)      default(""), not null
#

class LeagueAlias < ApplicationRecord
  include BasicConcern
  belongs_to :league
end
