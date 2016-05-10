class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  def new
    @patient = Patient.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_patient
    @patient = Patient.find(params[:id])
  rescue ActiveRecord::RecordNotFound => _
    render_404
  end
end
