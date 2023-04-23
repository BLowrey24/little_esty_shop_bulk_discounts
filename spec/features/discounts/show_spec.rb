require 'rails_helper'

RSpec.describe "discount show page", type: :feature do
  before(:each) do
    @merchant = Merchant.create!(name: "Merchant", status: 0)

    @discount_1 = @merchant.discounts.create!(percent: 10, threshold: 50)
    @discount_2 = @merchant.discounts.create!(percent: 20, threshold: 10)
  end

  describe 'when I visit a discounts show page' do
    it 'shows the discounts id, percentage, and threshold' do
      visit merchant_discount_path(@merchant.id, @discount_1.id)

      expect(page).to have_content("Discount ID: ##{@discount_1.id}")
      expect(page).to have_content("Percent: #{@discount_1.percent}%")
      expect(page).to have_content("Threshold: #{@discount_1.threshold}")

      expect(page).to_not have_content("Discount ID: ##{@discount_2.id}")
      expect(page).to_not have_content("Percent: #{@discount_2.percent}%")
      expect(page).to_not have_content("Threshold: #{@discount_2.threshold}")
    end

    it 'should have a button that allows me to edit the discount' do
      visit merchant_discount_path(@merchant.id, @discount_1.id)

      expect(page).to have_button("Edit")
      click_button("Edit")

      expect(current_path).to eq(edit_merchant_discount_path(@merchant.id, @discount_1.id))
    end
  end
end