# == Schema Information
#
# Table name: league_aliases
#
#  id        :bigint           not null, primary key
#  league_id :bigint
#  name      :string(255)      default(""), not null
#

class LeagueAlias < ApplicationRecord
  include BasicConcern
  belongs_to :league
end
