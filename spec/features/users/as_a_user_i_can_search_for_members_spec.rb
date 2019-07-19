require 'rails_helper'

describe 'as a user' do
  describe 'when i visit the root path' do
    it 'should should be able to search for members' do
      VCR.use_cassette('westeros_saas_get_house') do
        visit root_path
      end

      expect(current_path).to eq(root_path)

      select 'Greyjoy', :from => "house[house_id]"
      VCR.use_cassette('westeros_saas_get_members') do
        click_on('Get Members')
      end

      expect(current_path).to eq(search_path)

      expect(page).to have_content('7 Members')
      within '.members' do
        expect(page).to have_selector('.member', count: 7)
        within first('.member') do
          expect(page).to have_css('.id')
          expect(page).to have_css('.name')
        end
      end
    end
  end
end
