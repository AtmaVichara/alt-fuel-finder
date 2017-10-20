class Station
  attr_reader :name, :address, :fuel_types, :distance, :access_times

  def initialize(attrs = {})
    @attrs = attrs
    @name = attrs[:station_name]
    @fuel_types = attrs[:fuel_type_code]
    @distance = attrs[:distance]
    @access_times = attrs[:access_days_time]
  end

  def address
    "#{attrs[:street_address]} #{attrs[:city]}, #{attrs[:state]} #{attrs[:zip]}"
  end

  def self.filter_by_zip(zip)
    raw_stations = NrelService.stations_by_zip(zip)
    raw_stations.map do |raw_station|
      Station.new(raw_station)
    end
  end

  private
    attr_reader :attrs
end
