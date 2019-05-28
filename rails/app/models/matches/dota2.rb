# == Schema Information
#
# Table name: matches
#
#  id        :bigint           not null, primary key
#  battle_id :bigint
#  start_at  :datetime
#  end_at    :datetime
#  reverse   :boolean          default(FALSE)
#  type      :string(255)
#

module Matches
  class Dota2 < Match
    has_one :info, as: :infoable, class_name: "Dota2Info"
  end
end
