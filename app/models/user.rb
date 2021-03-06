class User < ApplicationRecord
  has_many :points_of_interests, inverse_of: :user
  accepts_nested_attributes_for :points_of_interests, reject_if: :all_blank, allow_destroy: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.to_csv
    attributes = %w(id email admin gender age)

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << user.attributes.values_at(*attributes)
      end
    end
  end
end
