FactoryGirl.define do 
  factory :location_valid, class: "Location" do 
    id 1
    name "Test location 1"
    code "tl1"
  end

  factory :location_invalid, class: "Location" do 
    name ""
    code "tl1"
  end

  factory :location_invalid2, class: "Location" do 
    name "a" * 81
    code "b" * 11
  end
end
