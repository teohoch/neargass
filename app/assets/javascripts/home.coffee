# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#locations_code').tokenInput '/locations.json', theme: 'facebook', queryParam: 'name', hintText: 'Ingrese la comuna a buscar', noResultsText: 'No se encontraron resultados', searchingText: 'Buscando...'

  send_location = (location) ->
    $('#latlong').val location.coords.latitude + "," + location.coords.longitude
    #alert location.coords.longitude + "," + location.coords.latitude

  location_error = (err) ->
    console.warn('ERROR(${err.code}): ${err.message}')


  $('#geo_slider').on 'click', (event) ->
    if $('#checkboxThreeInput').val() == '0'
      if navigator.geolocation
        navigator.geolocation.getCurrentPosition send_location, location_error,  {timeout:10000, enableHighAccuracy:true}
      else
        log('Geolocation is not supported by this browser.')
      $('#checkboxThreeInput').val('1')
      $('#token-input-locations_code').prop('disabled', true)
      $('#nearest_div').show()
    else
      $('#checkboxThreeInput').val('0')
      $('#latlong').val null
      $('#token-input-locations_code').prop('disabled', false)
      $('#nearest_div').hide()

  return









