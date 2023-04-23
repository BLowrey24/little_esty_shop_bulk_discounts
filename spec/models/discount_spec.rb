require 'rails_helper'

RSpec.describe Discount, type: :model do
  # before(:each) do
  #   @merchant = Merchant.create!(name: "Merchant", status: 0)

  #   @discount_1 = @merchant.discounts.create!(percent: 10, threshold: 0)
  #   @discount_2 = @merchant.discounts.create!(percent: 0, threshold: 10)
  # end
  describe 'relationships' do
    it { should belong_to :merchant }
    it { should have_many(:items).through(:merchant) }
  end

  describe "validations" do
    it {should validate_presence_of :threshold}
    it {should validate_presence_of :percent}
    # it 'should validate the percent attribute and the threshold attribute' do
    #   expect(@discount_1).to_not be_valid
    #   expect(@discount_2).to_not be_valid
    # end
  end
end