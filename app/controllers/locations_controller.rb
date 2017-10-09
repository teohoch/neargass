class LocationsController < ApplicationController
  before_action :set_location, only: [:show]

  # GET /locations
  # GET /locations.json
  def index
    @locations =
      if location_params_get[:request_codename]
        Location.select_class(location_params_get[:request_codename])
                .select(:code, :full_name)
                .where('full_name ilike ?',
                       "%#{location_params_get[:name]}%")
      else
        Commune.select(:code, :full_name)
               .where('full_name ilike ?',
                      "%#{location_params_get[:name]}%")
      end
  rescue ActionController::ParameterMissing
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_location
    @location = Location.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def location_params
    params.require(:location).permit(:name, :request_codename, :type, :code, :id)
  end

  def location_params_get
    params.permit(:name, :request_codename, :type, :code, :id)
  end
end
