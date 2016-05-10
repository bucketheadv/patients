require 'rails_helper'

RSpec.describe Patient, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before(:each) { 
    @patient_valid = FactoryGirl.build(:patient_valid) 
    @patient_invalid = FactoryGirl.build(:patient_invalid)
  }

  it "should be valid" do 
    expect(@patient_valid).to be_valid
  end

  it "should be invalid" do 
    expect(@patient_invalid).to be_invalid
    errors = {
      first_name: [I18n.t("errors.messages.blank")],
      last_name: [I18n.t("errors.messages.blank")],
      status_id: [I18n.t("errors.messages.inclusion")],
      gender_id: [I18n.t("errors.messages.inclusion")]
    }
    expect(@patient_invalid.errors.messages).to eq errors
  end
end
