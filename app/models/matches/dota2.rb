module Matches
  class Dota2 < Match
    has_one :info, as: :infoable, class_name: "Dota2Info"
  end
end