class WestrerosService

  def initialize
  end

  def get_member_info(search)
    get_json(search)[:data][0][:attributes][:members]
  end

  private

  def conn
    Faraday.new('http://westerosapi.herokuapp.com/api/v1/')
  end 

  def get_json(params = {})
    response = conn.get do |f|
      f.path = "house/#{params}"
      f.params['api_key'] = ENV['WESTEROS_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end