require 'rails_helper'

RSpec.describe 'Shelter Update' do
  describe 'As a visitor' do
    describe 'when I visit the shelter show page' do
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

    describe 'when I visit the shelter index page' do
      it 'I can update the shelter' do
        shelter = Shelter.create(name: 'Rescue me')

        visit '/shelters'

        within("#shelter-#{shelter.id}") do
          expect(page).to have_link('edit')
          click_link 'edit'
        end

        fill_in 'Name', with: 'foobar shelter'

        click_on 'Update Shelter'

        expect(current_path).to eq("/shelters/#{shelter.id}")
        expect(page).to have_content('foobar shelter')
      end

      it 'I can delete the shelter' do
        shelter = Shelter.create(name: 'Rescue me')

        visit '/shelters'

        within("#shelter-#{shelter.id}") do
          expect(page).to have_link('delete')
          click_link 'delete'
          expect(current_path).to eq('/shelters')
        end
      end
    end
  end
end
