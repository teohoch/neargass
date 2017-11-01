# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#locations_code').tokenInput '/locations.json', theme: 'facebook', queryParam: 'name'

  send_location = (location) ->
    $('#latlong').val location.coords.longitude + "," + location.coords.latitude
    alert location.coords.longitude + "," + location.coords.latitude

  location_error = (err) ->
    console.warn('ERROR(${err.code}): ${err.message}')


  $('#geo_slider').on 'click', (event) ->
    if $('#checkboxThreeInput').val() == '0'
      if navigator.geolocation
        navigator.geolocation.getCurrentPosition send_location, location_error,  {timeout:10000}
      else
        log('Geolocation is not supported by this browser.')
      $('#checkboxThreeInput').val('1')
      $('#token-input-locations_code').prop('disabled', true)
    else
      $('#checkboxThreeInput').val('0')
      $('#latlong').val null
      $('#token-input-locations_code').prop('disabled', false)

  return









