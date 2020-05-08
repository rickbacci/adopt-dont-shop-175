require 'rails_helper'

RSpec.describe 'Shelter Update' do
  describe 'As a visitor' do
    describe 'When I visit the shelter show page' do
      it 'I can update the shelter' do
        shelter = Shelter.create(name: 'foo shelter')
        visit "/shelters/#{shelter.id}"

        expect(page).to have_link ('Update Shelter')

        click_link ('Update Shelter')

        fill_in 'Name', with: 'foobar shelter'

        click_on 'Update Shelter'

        expect(current_path).to eq("/shelters/#{shelter.id}")
        expect(page).to have_content('foobar shelter')
      end
    end
  end
end
