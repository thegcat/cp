FactoryGirl.define do
  factory :project do
    sequence :name do |p|
      "My little project #{p}"
    end
  end
end
