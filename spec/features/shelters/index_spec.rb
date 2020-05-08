require 'rails_helper'

RSpec.describe 'Shelter index', type: :feature do
  before :each do
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
end
