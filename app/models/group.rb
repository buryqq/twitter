    class Group < ApplicationRecord
  has_many :users_groups
  has_many :users, -> { distinct }, through: :users_groups
end
