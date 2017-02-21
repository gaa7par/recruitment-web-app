class User < ApplicationRecord
  has_many :points_of_interests, inverse_of: :user
  accepts_nested_attributes_for :points_of_interests, reject_if: :all_blank, allow_destroy: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
