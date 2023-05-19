require 'net/http'

module DistanceCalculator
  def self.calculate_distance(zip1, zip2)
    return Float::INFINITY if zip1.nil? || zip2.nil?

    api_key = ENV['GMAP_API_KEY']
    uri = URI("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{zip1}&destinations=#{zip2}&key=#{api_key}")
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)

    distance = result['rows'][0]['elements'][0]['distance']['value'] if result['status'] == 'OK'
    distance || Float::INFINITY
  end
end
