require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  before(:each) do 
    FactoryGirl.create(:patient_valid)
  end
  it "should view index" do 
    get :index
    expect(response).to render_template('index')
  end

  it "should view index" do 
    get :show, id: 1
    expect(response).to render_template('show')
  end

  it "should view new" do 
    get :new
    expect(response).to render_template('new')
  end

  it "should view edit" do 
    get :edit, id: 1
    expect(response).to render_template('edit')
  end

  it "should destroy" do 
    delete :destroy, id: 1
    expect(Patient.find(1).deleted).to eq true
  end
end
