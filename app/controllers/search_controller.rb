class SearchController < ApplicationController
  def show
    search_string = params['house']['house_id']
    results = WestrerosService.new.get_member_info(search_string)
    @members = to_members(results)
  end

  private

  def to_members(members)
    members.map do |member|
      Member.new(member[:id], member[:name])
    end
  end
end
