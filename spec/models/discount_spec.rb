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
    it {should validate_numericality_of(:percent)}
    it {should validate_numericality_of(:threshold)}
  end
end