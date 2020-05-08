require 'rails_helper'

RSpec.describe 'Shelter index', type: :feature do
  before :each do
    @shelter1 = Shelter.create!(name: 'Meow Kitty - rescue me!')
    @shelter2 = Shelter.create!(name: 'Scruffy puppies rescue')
    @shelter3 = Shelter.create!(name: 'Old puddy-cat home')
  end

  it 'displays a list of shelters' do

    visit "/shelters"

    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content(@shelter2.name)
    expect(page).to have_content(@shelter3.name)
  end
end
