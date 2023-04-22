require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe 'relationships' do
    it { should belong_to :merchant }
    it { should have_many(:items).through(:merchant) }
  end

  describe "validations" do
    it {should validate_presence_of :threshold}
    it {should validate_presence_of :percent}
  end
end