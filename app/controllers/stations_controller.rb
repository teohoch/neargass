class StationsController < ApplicationController
  before_action :set_station, only: [:show]

  # GET /stations
  # GET /stations.json
  def index
    consumer = CNEConsumer.new
    codes = station_params[:code].split(',')
    @stations = consumer.gas_stations_by_location(commune: codes)
    rendered_stations = (render_to_string partial: 'index_partial', locals: { stations: @stations }).to_json
    respond_to do |format|
      format.html
      format.js { render 'index', locals: { rendered_stations: rendered_stations }}
      format.json
    end
  end

  # GET /stations/1
  # GET /stations/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_station
    @station = Station.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def station_params
    params.require('locations').permit('code')
  end
end
