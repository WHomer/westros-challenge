require 'rails_helper'

describe 'as a user' do
  describe 'when i visit the root path' do
    it 'should see dropdown' do
      visit root_path

      expect(current_path).to eq(root_path)

      select 'Greyjoy', :from => "house"
      click_on('Get Members')

      expect(current_path).to eq(seach_path('house=greyjoy'))

      expect(page).to have_content('7 Members')
      within '.members' do
        exepect(page).to have_selector('.member', count: 7)
        within first('.member') do
          expect(page).to have_css('.id')
          expect(page).to have_css('.name')
        end
    end
  end
end


# When I visit "/"
# And I select "Greyjoy" from the dropdown
# And I click on "Get Members"
# Then my path should be "/search" with "house=greyjoy" in the parameters
# And I should see a message "7 Members"
# And I should see a list of the 7 members of House Greyjoy
# And I should see a name and id for each member.