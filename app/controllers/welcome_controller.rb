class WelcomeController < ApplicationController
  def index
    @houses = [
      ['Stark', 'stark'],
      ['Lannister', 'lannister'],
      ['Targaryen', 'targaryen'],
      ['Tyrell', 'tyrell'],
      ['Greyjoy', 'greyjoy']
    ]
  end
end