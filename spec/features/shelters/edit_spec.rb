require 'rails_helper'

RSpec.describe 'Shelter Update' do

  before :all do
    @shelter = Shelter.create(name: 'foo shelter')
  end

  describe 'As a visitor' do
    describe 'when I visit the shelter show page' do

      it 'I can update the shelter' do
        visit "/shelters/#{@shelter.id}"

        expect(page).to have_link ('Update Shelter')

        click_link ('Update Shelter')

        fill_in 'Name', with: 'foobar shelter'

        click_on 'Update Shelter'

        expect(current_path).to eq("/shelters/#{@shelter.id}")
        expect(page).to have_content('foobar shelter')
      end

    end

    describe 'when I visit the shelter index page' do

      it 'I can update the shelter' do

        visit '/shelters'

        within("#shelter-#{@shelter.id}") do
          expect(page).to have_link('edit')
          click_link 'edit'
        end

        fill_in 'Name', with: 'foobar shelter'

        click_on 'Update Shelter'

        expect(current_path).to eq("/shelters/#{@shelter.id}")
        expect(page).to have_content('foobar shelter')
      end

    end
  end

  after :all do
    Pet.destroy_all
    Shelter.destroy_all
  end

end
