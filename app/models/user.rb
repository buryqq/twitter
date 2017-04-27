class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :tweets
has_many :users_groups
has_many :groups,  -> { distinct }, through: :users_groups

accepts_nested_attributes_for :groups, :allow_destroy => true

end
