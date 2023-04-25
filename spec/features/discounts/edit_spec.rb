require 'rails_helper'

RSpec.describe "Discount edit page", type: :feature do
  before(:each) do
    @merchant = Merchant.create!(name: "Merchant", status: 0)
    @discount = @merchant.discounts.create!(percent: 20, threshold: 10)
    visit edit_merchant_discount_path(@merchant.id, @discount.id)
  end

  describe 'when I visit the discount edit page' do
    it 'it shows a form that has the discounts attributes' do
      expect(page).to have_field(:percent, with: 20)
      expect(page).to have_field(:threshold, with: 10)
      expect(page).to have_button(:Update)
    end

    it 'I can change one attribute and still update the discount' do
      fill_in :percent, with: 25
      click_button(:Update)

      expect(current_path).to eq(merchant_discount_path(@merchant.id, @discount.id))

      expect(page).to have_content("Discount ID: ##{@discount.id}")
      expect(page).to have_content("Percent: 25%")
      expect(page).to have_content("Threshold: #{@discount.threshold}")
    end

    it 'I can change one attribute and still update the discount' do
      fill_in :threshold, with: 5
      click_button(:Update)

      expect(current_path).to eq(merchant_discount_path(@merchant.id, @discount.id))

      expect(page).to have_content("Discount ID: ##{@discount.id}")
      expect(page).to have_content("Percent: #{@discount.percent}")
      expect(page).to have_content("Threshold: 5")
    end

    it 'I can change both attributes and still update the discount' do
      fill_in :percent, with: 25
      fill_in :threshold, with: 5
      click_button(:Update)

      expect(current_path).to eq(merchant_discount_path(@merchant.id, @discount.id))

      expect(page).to have_content("Discount ID: ##{@discount.id}")
      expect(page).to have_content("Percent: 25%")
      expect(page).to have_content("Threshold: 5")
    end
    it "will not allow me to update a discount with a threshold of 0 or less" do
      fill_in :threshold, with: 0
      click_button(:Update)
      expect(page).to have_content("All fields must be filled above 0 and below 100.")
      
      fill_in :percent, with: 0
      click_button(:Update)
      expect(page).to have_content("All fields must be filled above 0 and below 100.")
    end
  end
end