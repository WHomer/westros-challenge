class SearchController < ApplicationController
  def show
    search_string = params['house']['house_id']
    results = get_json(search_string)[:data][0][:attributes][:members]
    @members = to_members(results)
  end

  private

  def to_members(members)
    members.map do |member|
      Member.new(member[:id], member[:name])
    end
  end

  def conn
    Faraday.new('http://westerosapi.herokuapp.com/api/v1/')
  end 

  def get_json(params = {})
    response = conn.get do |f|
      f.path = "house/#{params}"
      f.params['api_key'] = 'egg'
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
