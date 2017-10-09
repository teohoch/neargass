# @author Teodoro Hochfarber
require 'httparty'
require 'json'

# Consumes data from the DPA (Division Politico Administrativa) API
class DPAConsumer
  include HTTParty
  base_uri 'http://apis.modernizacion.cl/dpa'


  # @return [JSON Object] Returns a JSON Object with all the Communes in the
  #   DPA API
  def communes
    response = self.class.get('/comunas')
    raise 'Error ' + response.code.to_s + ' from server.' if response.code != 200
    JSON.parse(response.body)
  end

  # @return [JSON Object] Returns a JSON Object with all the Provinces in the
  #   DPA API
  def provinces
    response = self.class.get('/provincias')
    raise 'Error ' + response.code.to_s + ' from server.' if response.code != 200
    JSON.parse(response.body)
  end

  # @param [Numeric] province_code Numeric code corresponding to the desired
  #   Region
  # @return [JSON Object] Returns a JSON Object with all the Communes from the
  #   desired Region in the DPA API
  def communes_in_province(province_code)
    response = self.class.get("/provincias/#{province_code}/comunas/")
    raise 'Error ' + response.code.to_s + ' from server.' if response.code != 200
    JSON.parse(response.body)
  end

  # @return [JSON Object] Returns a JSON Object with all the Regions in the
  #   DPA API
  def regions
    response = self.class.get('/regiones')
    raise 'Error ' + response.code.to_s + ' from server.' if response.code != 200
    JSON.parse(response.body)
  end

  # @param [Numeric] region_code Numeric code corresponding to the desired
  #   Region
  # @return [JSON Object] Returns a JSON Object with all the Provinces from the
  #   desired Region in the DPA API
  def provinces_in_region(region_code)
    response = self.class.get("/regiones/#{region_code}/provincias/")
    raise 'Error ' + response.code.to_s + ' from server.' if response.code != 200
    JSON.parse(response.body)
  end

  # @param [Numeric] region_code Numeric code corresponding to the desired
  #   Region
  # @return [JSON Object] Returns a JSON Object with all the Communes from the
  #   desired Region in the DPA API
  def communes_in_region(region_code)
    response = self.class.get("/regiones/#{region_code}/comunas/")
    raise 'Error ' + response.code.to_s + ' from server.' if response.code != 200
    JSON.parse(response.body)
  end
end