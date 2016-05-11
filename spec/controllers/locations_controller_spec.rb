require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  describe "GET /locations/show" do 
    before(:each) do 
      FactoryGirl.create(:patient_valid)
      FactoryGirl.create(:location_valid)
    end
    it "works! should render location name and patients" do 
      get :show, id: 1
      expect(response).to have_http_status(200)
      expect(assigns(:location).name).to eq "Test location 1"
      expect(assigns(:location).patients.count).to eq 1
    end
  end
end
