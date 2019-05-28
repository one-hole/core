# == Schema Information
#
# Table name: team_aliases
#
#  id      :bigint           not null, primary key
#  team_id :bigint
#  name    :string(255)      default(""), not null
#

class TeamAlias < ApplicationRecord
  include BasicConcern
  belongs_to :team
end
