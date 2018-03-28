class NService

  def initialize(params)
    @params = params
  end

  def nearest_stations
    get_url("/api/alt-fuel-stations/v1/nearest?limit=10&fuel_type=ELEC,LPG&location=#{@params}")['response']['fuel_stations']
  end

  private

    def get_url(url)
      response = conn.get(url)
      Hash.from_xml(response.body)
    end

    def headers
      {
        'X-Api-Key' => ENV["API_KEY"]
      }
    end

    def conn
      Faraday.new(url: 'https://developer.nrel.gov', headers: headers)
    end

end
