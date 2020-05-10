require 'rails_helper'

RSpec.describe 'Shelter Pet Creation', type: :feature do
  before :all do
    @shelter = Shelter.create(name: 'foo shelter')
  end

  describe 'As a visitor to the Shelter Pets Index page' do
    describe 'when I visit the New Shelter Pet form by clicking the link' do
      it 'creates a new shelter pet' do

        visit "/shelters/#{@shelter.id}/pets"

        expect(page).to have_link('Create Pet')

        click_link ('Create Pet')

        expect(current_path).to eq("/shelters/#{@shelter.id}/pets/new")

        fill_in 'Name', with: 'Marvin'
        fill_in 'Image', with: 'kitty.jpg'
        fill_in 'Description', with: 'old puddy'
        fill_in 'Age', with: '16'
        fill_in 'Sex', with: 'male'

        click_on ('Create Pet')

        expect(current_path).to eq("/shelters/#{@shelter.id}/pets")
        expect(page).to have_content('adoptable')
      end
    end
  end

  after :all do
    Pet.destroy_all
    Shelter.destroy_all
  end
end
