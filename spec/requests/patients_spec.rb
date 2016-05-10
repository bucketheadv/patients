require 'rails_helper'

RSpec.describe "Patients", type: :request do
  before(:each) do 
    FactoryGirl.create(:patient_valid)
  end
  describe "GET /patients" do
    it "works! (now write some real specs)" do
      get patients_path
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
      expect(response.body).to include(I18n.t("activerecord.attributes.patient.mr_number"))
    end
  end

  describe "GET /show" do 
    it "works! Visit the detail of Patient" do 
      get patient_path(1)
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /patients" do 
    it "works! Create a patient" do 
      post patients_path, patient: {first_name: 'Tank', last_name: 'Lee', gender_id: 1, status_id: 0}
      expect(response).to redirect_to(assigns(:patient))
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /patients/new" do 
    it "works! Visit the page to create Patient" do 
      get new_patient_path
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /patients/edit" do 
    it "works! Visit the page to edit Patient" do 
      get edit_patient_path(1)
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /patients/1" do 
    it "works! should delete a patient" do 
      delete patient_path(1)
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(patients_path)
    end
  end
end
