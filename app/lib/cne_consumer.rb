# @author Teodoro Hochfarber
require 'httparty'
require 'json'

# Consumes data from the CNE API
# If the service is working correctly, returns the requested data in JSON form.
class CNEConsumer
  include HTTParty
  base_uri 'http://api.cne.cl'

  def initialize(token = 'G005wT96IA')
    # TODO, Load token from ENV
    @token = token
  end

  # @param [Numeric] region
  # @param [Numeric] commune
  # @return [JSON Object] JSON Object with the requested data
  def gas_stations_by_location(region: nil, commune: nil)
    if region.nil? && commune.nil?
      raise ArgumentError, 'Either the region or the commune must be provided'
    end
    query = {token: @token}
    region.nil? ? nil : query[:region] = formater(region)
    commune.nil? ? nil : query[:comuna] = formater(commune)
    response = self.class.get('/v3/combustibles/vehicular/estaciones',query: query)
    raise 'Error ' + response.code.to_s + ' from server.' if response.code != 200
    JSON.parse(response.body)['data']
  end

  private

  def formater(input)
    if input.is_a?(Array)
      input.map(&:to_i).to_s
    else
      input.to_s
    end

  end
end