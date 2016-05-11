class LocationsController < ApplicationController
  def show
    @location = Location.includes(:patients).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
