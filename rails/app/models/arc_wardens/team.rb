# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  game_id    :bigint
#  name       :string(255)      default("")
#  abbr       :string(255)      default("")
#  logo       :string(255)      default("")
#  offical_id :bigint
#  country    :string(255)
#  region     :string(255)
#  operated   :boolean          default(FALSE)
#  oh_id      :integer
#

module ArcWardens
  class Team < ApplicationRecord
    include ArcWardenConcern
    self.table_name = :teams
    self.inheritance_column = :_type_disabled

    has_many :team_aliases, foreign_key: :team_id

    def self.migrate      
      self.includes(:team_aliases).each do |aw_team|        
        new_team = ::Team.find_or_create_by(
               id: aw_team.id,
            oh_id: aw_team.id,
          game_id: aw_team.game_id,
             name: aw_team.name,
             abbr: aw_team.tag,
             logo: aw_team.logo,
          country: aw_team.country,
           region: aw_team.region,
         operated: aw_team.operated,
       offical_id: aw_team.extern_id
        )
        aw_team.team_aliases.each do |ali|
          new_team.aliases.find_or_create_by(name: ali.alias_name)
        end
      end
    end
  end
end
