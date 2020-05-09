require 'rails_helper'

RSpec.describe 'Shelter delete' do
  describe 'As a visitor' do
    describe 'When I visit the shelter show page' do
      it 'I can delete the shelter' do
        shelter = Shelter.create(name: 'rescue puppies inc.')
        visit "/shelters/#{shelter.id}"

        expect(page).to have_link('Delete Shelter')

        click_link('Delete Shelter')

        expect(current_path).to eq('/shelters')
        expect(page).to_not have_content(shelter.name)
      end
    end
  end
end
