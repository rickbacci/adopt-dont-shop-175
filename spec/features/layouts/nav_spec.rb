require 'rails_helper'

RSpec.describe 'As a visitor' do

  before :all do
    shelter = Shelter.create(name: 'foo')
    shelter.pets.create(name: 'pet')
  end

  context 'when I visit any page on the site' do
    it 'at the top of the page, I see a link to the Pets Index page' do

      visit '/shelters'

      within('nav') do
        click_link 'Pets'
      end

      expect(current_path).to eq('/pets')
    end

    it 'at the top of the page, I see a link to the Shelters Index page' do

      visit '/pets'

      within('nav') do
        click_link 'Shelters'
      end

      expect(current_path).to eq('/shelters')
    end
  end

  after :all do
    Pet.destroy_all
    Shelter.destroy_all
  end

end
