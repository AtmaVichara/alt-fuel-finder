class NPresenter

  def initialize(location)
    nrel = NService.new(location)
    @station_data = nrel.nearest_stations
    @stations = Station.create_stations(@station_data)
  end

  def sorted_stations
    @stations.sort_by(&:distance)
  end

end
