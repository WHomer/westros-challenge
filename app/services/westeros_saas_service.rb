class WesterosSaasService

  def initialize
    @key = ENV['WESTEROS_SAAS_KEY']
  end

  def get_house_info
    get_json('house')
  end

  def get_member_info(id)
    get_json("house/#{id}")
  end

  private

  def conn
    Faraday.new('https://westeros-as-a-service.herokuapp.com/api/v1/')
  end 

  def get_json(path)
    response = conn.get do |req|
      req.headers['x_api_key'] = @key
      req.path = path
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
