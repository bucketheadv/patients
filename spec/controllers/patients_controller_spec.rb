require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  before(:each) {
    @patient_valid = FactoryGirl.create(:patient_valid)
  }
  it "should view index" do 
    get :index
    expect(response).to render_template('index')
    expect(assigns(:patients).length).to eq 1
  end

  it "should view index" do 
    get :show, id: 1
    expect(response).to render_template('show')
    expect(assigns(:patient).viewed_count).to eq @patient_valid.viewed_count + 1
  end

  it "should view new" do 
    get :new
    expect(response).to render_template('new')
  end

  it "should view edit" do 
    get :edit, id: 1
    expect(response).to render_template('edit')
  end

  it "should update" do 
    patch :update, id: 1, patient: {gender_id: 1}
    expect(assigns(:patient).gender_id).to eq 1
  end

  it "should not update" do 
    patch :update, id: 1, patient: {gender_id: 3}
    expect(assigns(:patient).errors).not_to be_empty
  end

  it "should destroy" do 
    delete :destroy, id: 1
    expect(assigns(:patient).deleted).to eq true
  end
end
