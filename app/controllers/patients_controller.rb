class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  def index 
    @patients = Patient.not_deleted
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient
    else
      render :new
    end
  end

  def show
    @patient.viewed_count_up
  end

  def edit
  end

  def update
    if @patient.update_attributes(patient_params)
      redirect_to @patient
    else
      render :edit
    end
  end

  def destroy
    @patient.update_attributes(deleted: true)
    redirect_to action: :index
  end

  private
  def patient_params 
    params.require(:patient).permit(:last_name, :first_name, :middle_name, :status_id, :gender_id, :location_id, :birthday)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  rescue ActiveRecord::RecordNotFound => _
    render_404
  end
end
