# == Schema Information
#
# Table name: games
#
#  id      :bigint(8)        not null, primary key
#  name    :string(255)
#  cn_name :string(255)
#

class Game < ApplicationRecord
end
