require 'rails_helper'

RSpec.describe 'As a visitor' do
  context 'when I visit any page on the site' do
    it 'at the top of the page, I see a link to the Pet Index page' do
      shelter = Shelter.create(name: 'foo')
      shelter.pets.create(name: 'pet')

      visit '/shelters'

      within('nav') do
        click_link 'Pets'
      end

      expect(current_path).to eq('/pets')
    end
  end
end
