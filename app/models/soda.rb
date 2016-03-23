class Soda
  include HTTParty
  def initialize
    @token = "Okoqaqdr9i2rMDUwg9aj_0eL2VSH0GEX8PFd"
    @site = "https://data.sfgov.org/resource/rqzj-sfat.json"
  end

  def search(latitude, longitude)
    @site += "?$where=within_circle(location, #{latitude}, #{longitude}, 1000)"
    @json = HTTParty.get(@site).parsed_response

    to_list
  end

  def to_list
    results = []
    @json.each do |result|
      list = {}
      list[:schedule] = result['schedule']
      list[:address] = result['address']
      list[:vendor] = result['applicant']
      list[:food] = result['fooditems']
      list[:hours] = result['dayshours']
      results << list
    end
    results
  end

end
