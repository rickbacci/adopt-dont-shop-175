require 'rails_helper'

RSpec.describe 'Shelter create', type: :feature do

  describe 'As a visitor to the Shelter Index page' do
    describe 'When I visit the New Shelter form by clicking the link' do
      it 'creates a new shelter' do
        visit '/shelters'

        click_link 'New Shelter'

        expect(current_path).to eq('/shelters/new')

        fill_in 'Name', with: 'Puddy-cat shelter'
        fill_in 'Address', with: '123 19th Street'
        fill_in 'City', with: 'Denver'
        fill_in 'State', with: 'Colorado'
        fill_in 'Zip', with: '80202'

        click_on 'Create Shelter'

        expect(current_path).to eq('/shelters')
        expect(page).to have_content('Puddy-cat shelter')
      end
    end
  end
end
