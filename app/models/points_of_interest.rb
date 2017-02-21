class PointsOfInterest < ApplicationRecord
  TYPES_OF_POINTS = %w(health hobby work).freeze

  belongs_to :user, inverse_of: :points_of_interests

  validates :type_of_points, inclusion: { in: TYPES_OF_POINTS }
  validates :points, numericality: { greater_than_or_equal_to: 0 }
end
