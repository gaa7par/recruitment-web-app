FactoryGirl.define do
  factory :points_of_interest do
    user_id { create(:user).id }
    name 'My Points'
    type_of_points 'hobby'
    points 100
  end
end
