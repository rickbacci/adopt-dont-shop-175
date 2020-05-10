require 'rails_helper'

RSpec.describe 'Shelter delete' do
  before :all do
    @shelter = Shelter.create(name: 'rescue puppies inc.')
  end

  describe 'As a visitor' do
    describe 'When I visit the shelter show page' do
      it 'I can delete the shelter' do
        visit "/shelters/#{@shelter.id}"

        expect(page).to have_link('Delete Shelter')

        click_link('Delete Shelter')

        expect(current_path).to eq('/shelters')
        expect(page).to_not have_content(@shelter.name)
      end

    end

    describe 'When I visit the shelter index page' do
      it 'I can delete the shelter' do

        visit '/shelters'

        within("#shelter-#{@shelter.id}") do
          expect(page).to have_link('delete')
          click_link 'delete'
        end

        expect(current_path).to eq('/shelters')
        expect(page).to_not have_content(@shelter.name)
      end
    end
  end
end
