require 'rails_helper'

RSpec.describe "discount new page" do
  before :each do
    @merchant = Merchant.create!(name: "Name 1")
  end

  describe "when i visit the discount new page it" do
    it "shows a form to create a new discount" do
      visit new_merchant_discount_path(@merchant.id)

      expect(page).to have_field(:percent)
      expect(page).to have_field(:threshold)
      expect(page).to have_button('Create Discount')
    end

    it 'takes me to discount index page when the form is submitted' do
      visit new_merchant_discount_path(@merchant.id)
      
      fill_in :percent, with: 20
      fill_in :threshold, with: 10
      click_button('Create Discount')
      
      expect(current_path).to eq("/merchant/#{@merchant.id}/discounts")
      expect(page).to have_content("20%")
      expect(page).to have_content(10)
    end
    
    it 'gives an error message if all fields are not filled' do
      visit new_merchant_discount_path(@merchant.id)
      
      fill_in :percent, with: 20
      click_button('Create Discount')
      expect(page).to have_content("Fill in all fields.")
    end
  end
end