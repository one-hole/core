# == Schema Information
#
# Table name: team_aliases
#
#  id      :bigint           not null, primary key
#  team_id :bigint
#  name    :string(255)      default(""), not null
#

module ArcWardens
  class TeamAlias < ApplicationRecord
    include ArcWardenConcern
    self.table_name = "team_aliases"

  end
end
