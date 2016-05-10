FactoryGirl.define do
  factory :patient_valid, class: 'Patient' do
    id 1
    first_name "Joe"
    last_name "Satriani"
    gender_id 1
    status_id 0
  end

  factory :patient_invalid, class: 'Patient' do
    id 2
    first_name ""
    last_name ""
    gender_id 3
    status_id 5
  end
end
