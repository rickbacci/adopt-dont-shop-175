require 'rails_helper'

RSpec.describe 'Shelter show', type: :feature do
  before :all do
    @shelter = Shelter.create!(
      name: 'Shelter1',
      address: '123 foo st.',
      city: 'Denver',
      state: 'CO',
      zip: '80202'
    )
  end

  before :each do
    visit "/shelters/#{@shelter.id}"
  end

  it 'displays a shelters name' do
    expect(page).to have_content(@shelter.name)
  end

  it 'displays a shelters address' do
    expect(page).to have_content(@shelter.address)
  end

  it 'displays a shelters city' do
    expect(page).to have_content(@shelter.city)
  end

  it 'displays a shelters state' do
    expect(page).to have_content(@shelter.state)
  end

  it 'displays a shelters zip' do
    expect(page).to have_content(@shelter.zip)
  end

  it 'has a link to take me to the shelter\'s pets page' do
    expect(page).to have_link('View Pets')

    click_link 'View Pets'

    expect(current_path).to eq("/shelters/#{@shelter.id}/pets")
  end
end
