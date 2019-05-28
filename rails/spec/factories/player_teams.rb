# == Schema Information
#
# Table name: player_teams
#
#  id        :bigint           not null, primary key
#  player_id :bigint
#  team_id   :bigint
#  at        :datetime
#  action    :integer          default(0)
#

FactoryBot.define do
  factory :player_team do
    
  end
end
