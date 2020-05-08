require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'relationships' do
    it {should belong_to :shelter}
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end
end
