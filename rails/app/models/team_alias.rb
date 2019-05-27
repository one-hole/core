# == Schema Information
#
# Table name: team_aliases
#
#  id      :bigint(8)        not null, primary key
#  team_id :bigint(8)
#  name    :string(255)      default(""), not null
#

class TeamAlias < ApplicationRecord
  include BasicConcern
  belongs_to :team
end
