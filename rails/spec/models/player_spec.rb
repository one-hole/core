# == Schema Information
#
# Table name: players
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  abbr       :string(255)
#  avatar     :string(255)
#  team_id    :bigint
#  offical_id :bigint
#

require 'rails_helper'

RSpec.describe Player, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
