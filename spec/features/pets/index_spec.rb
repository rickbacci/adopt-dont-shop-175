require 'rails_helper'

RSpec.describe 'Pet Index', type: :feature do
  before :each do
    shelter = Shelter.create!(
      name: 'Shelter1',
      address: '123 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    )

    @pet = shelter.pets.create!(name: 'foo foo')
  end
  describe 'As a visitor' do
    describe 'When I visit the pets index page' do
      it 'I can see all the pets in the system' do
        visit '/pets'

        expect(page).to have_content(@pet.image)
        expect(page).to have_content(@pet.name)
        expect(page).to have_content(@pet.age)
        expect(page).to have_content(@pet.sex)
        expect(page).to have_content(@pet.shelter.name)
      end
    end
  end
end


# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
