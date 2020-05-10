require 'rails_helper'

RSpec.describe 'Shelter index', type: :feature do
  before :all do
    @shelter1 = Shelter.create!(
      name: 'Shelter1',
      address: '123 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    )

    @shelter2 = Shelter.create!(
      name: 'Shelter2',
      address: '234 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    )

    @shelter3 = Shelter.create!(
      name: 'Shelter3',
      address: '345 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    )
  end

  it 'displays a list of shelters' do

    visit "/shelters"

    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter2.name)
    expect(page).to have_content(@shelter3.name)
  end

  it 'clicking a shelter name takes me to the shelter show page' do
    visit "/shelters"

    within("#shelter-#{@shelter1.id}") do
      expect(page).to have_link(@shelter1.name)
      click_link @shelter1.name
      expect(current_path).to eq("/shelters/#{@shelter1.id}")
    end
  end

  after :all do
    Pet.destroy_all
    Shelter.destroy_all
  end
end
