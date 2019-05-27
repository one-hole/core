module Matches
  class Csgo < Match
    has_one :info, as: :infoable, class_name: "CsgoInfo"
  end
end