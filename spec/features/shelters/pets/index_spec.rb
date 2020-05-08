require 'rails_helper'

RSpec.describe 'Shelter Pets Index', type: :feature do
  before :each do
    @shelter = Shelter.create!(
      name: 'Shelter1',
      address: '123 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    )

    @pet = @shelter.pets.create(
      name: 'foo foo',
      image: 'foo foo image',
      age: '2',
      sex: 'Female')
  end

  describe 'As a visitor' do
    describe "when I visit '/shelters/:shelter_id/pets'" do
      it 'I can see all of the shelters pets' do
        visit "/shelters/#{@shelter.id}/pets"

        expect(page).to have_content(@pet.image)
        expect(page).to have_content(@pet.name)
        expect(page).to have_content(@pet.age)
        expect(page).to have_content(@pet.sex)
      end
    end
  end
end


