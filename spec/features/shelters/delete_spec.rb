require 'rails_helper'

RSpec.describe 'Shelter delete' do
  describe 'As a visitor' do
    describe 'When I visit the shelter show page' do
      it 'I can delete the shelter' do
        shelter = Shelter.create(name: 'foo shelter')
        visit "/shelters/#{shelter.id}"

        expect(page).to have_link('Delete Shelter')

        click_link('Delete Shelter')

        expect(current_path).to eq('/shelters')
        expect(page).to_not have_content(shelter.name)
      end
    end
  end
end

# User Story 6, Shelter Delete

# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter

