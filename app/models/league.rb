# == Schema Information
#
# Table name: leagues
#
#  id          :bigint(8)        not null, primary key
#  game_id     :bigint(8)
#  name        :string(255)
#  status      :integer
#  start_time  :datetime
#  end_time    :datetime
#  offical_id  :integer
#  hidden      :boolean          default(FALSE)
#  logo        :string(255)
#  second_logo :string(255)
#  aw_id       :integer
#

class League < ApplicationRecord
  include BasicConcern

  has_many :aliases, foreign_key: :league_id, class_name: 'LeagueAlias'
end
