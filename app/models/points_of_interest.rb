class PointsOfInterest < ApplicationRecord
  belongs_to :user, inverse_of: :points_of_interests
end
