class TeamAlias < ApplicationRecord
  include BasicConcern
  belongs_to :team
end
