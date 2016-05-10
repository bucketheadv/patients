require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "should be valid" do 
    before(:each) {
      @location_valid = FactoryGirl.build(:location_valid)
    }
    it "should be valid" do
      expect(@location_valid).to be_valid
    end
  end

  describe "should be invalid" do 
    before(:each) {
      @location_invalid = FactoryGirl.build(:location_invalid)
      @location_invalid2 = FactoryGirl.build(:location_invalid2)
    }
    it "should not be empty" do
      expect(@location_invalid).to be_invalid
      errors = {
        name: [I18n.t("errors.messages.blank")]
      }
      expect(@location_invalid.errors.messages).to eq errors
    end

    it "max length is limit" do 
      errors = {
        code: [I18n.t("errors.messages.too_long.other", count: 10)],
        name: [I18n.t("errors.messages.too_long.other", count: 80)]
      }
      expect(@location_invalid2).to be_invalid
      expect(@location_invalid2.errors.messages).to eq errors
    end
  end
end
