require 'rails_helper'

RSpec.describe 'Shelter Pets Index', type: :feature do
  before :all do
    @shelter = Shelter.create!(
      name: 'Shelter1',
      address: '123 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    )

    shelter2= Shelter.create!(
      name: 'Shelter2',
      address: '123 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    )

    @pet = @shelter.pets.create(
      name: 'foofoopending',
      image: 'foo foo image',
      age: '2',
      sex: 'Female',
      status: 'pending_adoption'
    )

    @pet3 = @shelter.pets.create(
      name: 'foo foo',
      image: 'foo foo image',
      age: '2',
      sex: 'Female',
      status: 'adoptable'
    )

    @pet2 = shelter2.pets.create(
      name: 'Cena puppy',
      image: 'cena.jpg',
      description: 'you can\'t see me',
      age: '2',
      sex: 'male',
      status: 'adoptable'
    )
  end

  describe 'As a visitor' do
    describe "when I visit '/shelters/:shelter_id/pets'" do
      it 'I can see all of the shelters pets' do
        visit "/shelters/#{@shelter.id}/pets"

        expect(page).to have_content(@pet.name)
      end

      it 'I cannot see other shelters pets' do
        visit "/shelters/#{@shelter.id}/pets"

        expect(page).to_not have_content(@pet2.name)
      end

      it 'I can see the pet\'s attributes' do
        visit "/shelters/#{@shelter.id}/pets"

        expect(page).to have_content(@pet.image)
        expect(page).to have_content(@pet.name)
        expect(page).to have_content(@pet.age)
        expect(page).to have_content(@pet.sex)
        expect(page).to have_content(@pet.status)
      end

      it 'I can click a link to edit a pet' do
        visit "/shelters/#{@shelter.id}/pets"

        within("#pet-#{@pet.id}") do
          expect(page).to have_link('edit')
          click_link 'edit'
          expect(current_path).to eq("/pets/#{@pet.id}/edit")
        end
      end

      it 'I can click a link to delete a pet' do
        visit "/shelters/#{@shelter.id}/pets"

        within("#pet-#{@pet.id}") do
          expect(page).to have_link('delete')
          click_link 'delete'
          expect(current_path).to eq('/pets')
        end
      end

      it 'clicking a pets name takes me to the pets show page' do
        visit "/shelters/#{@shelter.id}/pets"

        within("#pet-#{@pet.id}") do
          expect(page).to have_link(@pet.name)
          click_link @pet.name
          expect(current_path).to eq("/pets/#{@pet.id}")
        end
      end

      it 'I see a count of the number of pets at this shelter' do
        visit "/shelters/#{@shelter.id}/pets"

        pet_count = find(".shelter-pets-count").text

        expect(pet_count).to eq('2')
      end

      it 'adoptable pets are listed first' do
        visit "/shelters/#{@shelter.id}/pets"

        sorted = find('ul').all('li')[0].text.include? 'adoptable'

        expect(sorted).to be(true)
      end

      it 'I can click a link to show only adoptable pets' do
        visit "/shelters/#{@shelter.id}/pets"

        expect(find('ul')).to have_selector('li', count: 2)

        within("header") do
          click_link 'Adoptable Pets'
        end

        expect(find('ul')).to have_selector('li', count: 1)
      end

      it 'I can click a link to show only adoption pending pets' do
        visit "/shelters/#{@shelter.id}/pets"

        expect(find('ul')).to have_selector('li', count: 2)

        within("header") do
          click_link 'Adoption-Pending Pets'
        end

        expect(find('ul')).to have_selector('li', count: 1)
      end
    end
  end

  after :all do
    Pet.destroy_all
    Shelter.destroy_all
  end
end
