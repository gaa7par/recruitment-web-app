FactoryGirl.define do
  factory :points_of_interest do
    user_id { create(:user).id }
    points 100
  end
end
