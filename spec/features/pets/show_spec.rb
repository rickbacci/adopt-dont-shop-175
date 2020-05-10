require 'rails_helper'

RSpec.describe 'Pet Show', type: :feature do
  before :all do
    shelter = Shelter.create!(
      name: 'Shelter1',
      address: '123 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    )

    @pet = shelter.pets.create(
      name: 'Bugs',
      image: 'bunny.jpg',
      age: '5',
      sex: 'male',
      description: 'crazy rabbit',
      status: 'pending_adoption'
    )
  end

  before :each do
    visit "/pets/#{@pet.id}"
  end

  it 'displays the pets name' do
    expect(page).to have_content(@pet.name)
  end

  it 'displays the pets image' do
    expect(page).to have_content(@pet.image)
  end

  it 'displays the pets age' do
    expect(page).to have_content(@pet.age)
  end

  it 'displays the pets sex' do
    expect(page).to have_content(@pet.sex)
  end

  it 'displays the pets description' do
    expect(page).to have_content(@pet.description)
  end

  it 'displays the pets adoption status' do
    expect(page).to have_content(@pet.status)
  end

  after :all do
    Pet.destroy_all
    Shelter.destroy_all
  end
end
