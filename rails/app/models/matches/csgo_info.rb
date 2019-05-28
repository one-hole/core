# == Schema Information
#
# Table name: csgo_match_infos
#
#  id            :bigint           not null, primary key
#  infoable_type :string(255)      default("Match")
#  infoable_id   :bigint
#  map           :integer
#  result        :boolean
#

module Matches
  class CsgoInfo < ApplicationRecord
    self.table_name = "csgo_match_infos"

    belongs_to :infoable, polymorphic: true, optional: true
  end
end
