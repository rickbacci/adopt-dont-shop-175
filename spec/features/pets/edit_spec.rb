require 'rails_helper'

RSpec.describe 'Pet Update', type: :feature do
  describe 'As a visitor' do
    describe 'when I visit the Pet Show page' do
      it 'I can update the Pet' do
        shelter = Shelter.create(name: 'rescue ruppies')
        pet = shelter.pets.create(name: 'Speedy', status: 'adoptable')

        visit "/pets/#{pet.id}"

        expect(current_path).to eq("/pets/#{pet.id}")
        expect(page).to have_link('Update Pet')

        click_link 'Update Pet'
        expect(current_path).to eq("/pets/#{pet.id}/edit")

        fill_in 'Name', with: 'Turtle'

        click_on 'Update Pet'
        expect(current_path).to eq("/pets/#{pet.id}")
        expect(page).to have_content('Turtle')
      end
    end
  end
end
