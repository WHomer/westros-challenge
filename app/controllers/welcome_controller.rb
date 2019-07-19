class WelcomeController < ApplicationController
  def index
    results = WesterosSaasService.new.get_house_info
    @houses = to_houses(results)
  end

  private

  def to_houses(houses)
    houses.map do |house|
      [house[:name], house[:id]]
    end
  end
end