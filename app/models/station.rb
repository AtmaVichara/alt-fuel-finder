class Station

  attr_reader :name,
              :street,
              :city,
              :distance,
              :access_times,
              :fuel_type,
              :city,
              :zip,
              :state

  def initialize(info)
    @name = info["station_name"]
    @street = info["street_address"]
    @state = info["state"]
    @zip = info["zip"]
    @city   = info["city"]
    @distance = info["distance"]
    @access_times = info["access_days_time"]
    @fuel_type = info["fuel_type_code"]
  end

  def self.create_stations(stations)
    stations.map do |station|
      new(station)
    end
  end

end
