
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information
require 'rails_helper'

RSpec.describe 'Pet Update', type: :feature do
  describe 'As a visitor' do
    describe 'when I visit the Pet Show page' do
      it 'I can update the Pet' do
        shelter = Shelter.create(name: 'rescue ruppies')
        pet = shelter.pets.create(name: 'Speedy')

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
