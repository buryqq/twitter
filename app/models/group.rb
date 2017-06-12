    class Group < ApplicationRecord
  has_many :users_groups
  has_many :users, -> { distinct }, through: :users_groups
  validates_presence_of :name
end
