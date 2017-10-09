# @author Teodoro Hochfarber
require 'httparty'
require 'json'

# Consumes data from the CNE API
# If the service is working correctly, returns the requested data in JSON form.
class CNEConsumer
  include HTTParty
  base_uri 'http://api.cne.cl'

  def initialize(token = 'G005wT96IA')
    @token = token
  end

  # @param [Numeric] region
  # @param [Numeric] commune
  # @return [JSON Object] JSON Object with the requested data
  def gas_stations_by_location(region: nil, commune: nil)
    if region.nil? and commune.nil?
      raise ArgumentError, 'Either the region or the commune must be provided'
    end
    query = {token: @token}
    region.nil? ? nil : query[:region] = region
    commune.nil? ? nil : query[:comuna] = commune
    response = self.class.get('/v3/combustibles/vehicular/estaciones',
                              query: query)
    raise 'Error '+response.code.to_s+' from server.' if response.code != 200
    JSON.parse(response.body)
  end
end