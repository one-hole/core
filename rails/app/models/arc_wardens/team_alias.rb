# == Schema Information
#
# Table name: team_aliases
#
#  id      :bigint(8)        not null, primary key
#  team_id :bigint(8)
#  name    :string(255)      default(""), not null
#

module ArcWardens
  class TeamAlias < ApplicationRecord
    include ArcWardenConcern
    self.table_name = "team_aliases"

  end
end
