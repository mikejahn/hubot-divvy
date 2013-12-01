# Description:
#   Find Divvy bikes near you or your office
#
# Commands:
#   hubot find me divvy bikes near {location} - Find nearest divvy bikes near given address

nDivvy = require "ndivvy" 
geocoder = require "geocoder" 
Util = require "util"

module.exports = (robot) ->
  robot.respond /find me divvy bikes near (.*)/i, (msg) ->
    address = msg.match[1]
    geocoder.geocode address, (err, data) ->
      msg.send "Finding Bikes near #{data.results[0].formatted_address}"
      lat = data.results[0].geometry.location.lat
      lng = data.results[0].geometry.location.lng
      nDivvy.nearbyStations lat, lng, 5, (statusCode, stations) ->
        msg.send "Sorry, not able to find any stations at the moment..."  if statusCode is 404 or statusCode is 500
        for station in stations
          msg.send "Name: #{station.station.stationName}\n Available Bikes: #{station.station.availableBikes}\n Available Docks: #{station.station.availableDocks}\n Google Maps Link: http://maps.google.com/?q=#{station.station.latitude},#{station.station.longitude}\n"
          msg.send "http://maps.google.com/maps/api/staticmap?markers=#{station.station.latitude},#{station.station.longitude}&size=400x400&maptype=hybrid&sensor=false&format=png"