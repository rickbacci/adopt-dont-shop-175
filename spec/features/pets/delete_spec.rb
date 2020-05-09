require 'rails_helper'

RSpec.describe 'Pet Delete' do
  describe 'As a visitor' do
    describe 'When I visit the pet show page' do
      it 'I can delete the pet' do
        shelter = Shelter.create(name: 'rescue puppies inc.')
        pet = shelter.pets.create(name: 'sick puppy')
        visit "/pets/#{pet.id}"

        expect(page).to have_link('Delete Pet')

        click_link('Delete Pet')

        expect(current_path).to eq('/pets')
        expect(page).to_not have_content(pet.name)
      end
    end
  end
end
