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

require 'rails_helper'

RSpec.describe PlayerTeam, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
