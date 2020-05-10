require 'rails_helper'

RSpec.describe 'Pet Index', type: :feature do
  before :all do
    shelter = Shelter.create!(
      name: 'Shelter1',
      address: '123 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    )

    shelter2 = Shelter.create!(
      name: 'Shelter2',
      address: '234 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    )

    @pet = shelter.pets.create(
      name: 'foofoo#1',
      image: 'foofoo#1.jpg',
      age: '2',
      sex: 'Female',
      status: 'pending_adoption'
    )

    @pet2 = shelter.pets.create(
      name: 'foofoo#2',
      image: 'foofoo#2.jpg',
      age: '1',
      sex: 'male',
      status: 'adoptable'
    )

    @pet3 = shelter2.pets.create(
      name: 'foofoo#2',
      image: 'foofoo#2.jpg',
      age: '1',
      sex: 'male',
      status: 'adoptable'
    )

    @pet4 = shelter2.pets.create(
      name: 'foofoo#2',
      image: 'foofoo#2.jpg',
      age: '1',
      sex: 'male',
      status: 'pending_adoption'
    )
  end

  describe 'As a visitor' do
    describe 'when I visit /pets' do
      it 'I can see all the pets in the system' do
        visit '/pets'

        expect(page).to have_content(@pet.name)
        expect(page).to have_content(@pet2.name)
        expect(page).to have_content(@pet3.name)
        expect(page).to have_content(@pet4.name)
      end

      it 'I can see the pets attributes' do
        visit '/pets'

        expect(page).to have_content(@pet.image)
        expect(page).to have_content(@pet.name)
        expect(page).to have_content(@pet.age)
        expect(page).to have_content(@pet.sex)
        expect(page).to have_content(@pet.shelter.name)
        expect(page).to have_content(@pet.status)
      end

      it 'adoptable pets are listed first' do
        visit '/pets'

        sorted = find('ul').all('li')[0].text.include? 'adoptable'

        expect(sorted).to be(true)
      end

      it 'I can click a link to edit a pet' do
        visit '/pets'

        within("#pet-#{@pet.id}") do
          expect(page).to have_link('edit')
          click_link 'edit'
          expect(current_path).to eq("/pets/#{@pet.id}/edit")
        end
      end

      it 'I can click a link to delete a pet' do
        visit '/pets'

        within("#pet-#{@pet.id}") do
          expect(page).to have_link('delete')
          click_link 'delete'
          expect(current_path).to eq('/pets')
        end
      end

      it 'clicking a shelter name takes me to the shelter show page' do
        visit "/pets"

        within("#pet-#{@pet.id}") do
          expect(page).to have_link(@pet.shelter.name)
          click_link @pet.shelter.name
          expect(current_path).to eq("/shelters/#{@pet.shelter.id}")
        end
      end

      it 'clicking a pets name takes me to the pets show page' do
        visit "/pets"

        within("#pet-#{@pet.id}") do
          expect(page).to have_link(@pet.name)
          click_link @pet.name
          expect(current_path).to eq("/pets/#{@pet.id}")
        end
      end
    end
  end

  after :all do
    Pet.destroy_all
    Shelter.destroy_all
  end
end
