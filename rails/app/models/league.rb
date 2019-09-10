# == Schema Information
#
# Table name: leagues
#
#  id          :bigint           not null, primary key
#  game_id     :bigint
#  name        :string(255)
#  status      :integer
#  start_time  :datetime
#  end_time    :datetime
#  offical_id  :integer
#  hidden      :boolean          default(FALSE)
#  logo        :string(255)
#  second_logo :string(255)
#  oh_id       :integer
#

class League < ApplicationRecord
  include BasicConcern

  has_many :aliases, foreign_key: :league_id, class_name: 'LeagueAlias'
  accepts_nested_attributes_for :aliases

  class << self
    # 这里如果找不到、那么就需要创建 TODO
    def by_names(names, game_id)
      @league = League.where({name: names, game_id: game_id}).first
    end
  end
end
