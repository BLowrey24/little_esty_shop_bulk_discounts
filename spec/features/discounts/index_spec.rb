require 'rails_helper'

RSpec.describe 'Merchant discount index page', type: :feature do
  before(:each) do
    @merchant = Merchant.create!(name: "Merchant", status: 0)

    @discount_1 = @merchant.discounts.create!(percent: 10, threshold: 10)
    @discount_2 = @merchant.discounts.create!(percent: 20, threshold: 20)
    @discount_3 = @merchant.discounts.create!(percent: 30, threshold: 30)
    @discount_4 = @merchant.discounts.create!(percent: 40, threshold: 40)
  end
  describe 'when I visit a merchants dashboard' do
    it 'I see a link that can take me to the discount index page' do
      visit "merchant/#{@merchant.id}/dashboard"
      
      within(".navbar-nav") do
        expect(page).to have_link("Discounts")
        click_link "Discounts"
        expect(current_path).to eq("/merchant/#{@merchant.id}/discounts")
      end
    end
  end

  describe "when I visit the Merchants discounts index page it" do
    it "shows all discounts, including percent and threshold" do
      visit "/merchant/#{@merchant.id}/discounts"

      within("#discount-list") do
        within("#discount_#{@discount_1.id}") do
          expect(page).to have_link("##{@discount_1.id}")
          expect(page).to have_content("#{@discount_1.percent}%")
          expect(page).to have_content(@discount_1.threshold)
        end

        within("#discount_#{@discount_2.id}") do
          expect(page).to have_link("##{@discount_2.id}")
          expect(page).to have_content("#{@discount_2.percent}%")
          expect(page).to have_content(@discount_2.threshold)
        end

        within("#discount_#{@discount_3.id}") do
          expect(page).to have_link("##{@discount_3.id}")
          expect(page).to have_content("#{@discount_3.percent}%")
          expect(page).to have_content(@discount_3.threshold)
        end

        within("#discount_#{@discount_4.id}") do
          expect(page).to have_link("##{@discount_4.id}")
          expect(page).to have_content("#{@discount_4.percent}%")
          expect(page).to have_content(@discount_4.threshold)
        end
      end
    end

    it "shows a button to create a new discount and when clicked on I am taken to a page to create a discount" do
      visit "merchant/#{@merchant.id}/discounts"

      within("#header") do
        expect(page).to have_button("Create Discount")
        click_button("Create Discount")
      end

      expect(current_path).to eq("/merchant/#{@merchant.id}/discounts/new")
    end

    it 'shows a button to delete a discount' do
      visit "/merchant/#{@merchant.id}/discounts"
      expect(page).to have_button("Delete Discount")
      within("#discount_#{@discount_1.id}") do
        click_button("Delete Discount")
      end

      expect(page).to_not have_link("##{@discount_1.id}")
      expect(page).to_not have_content("#{@discount_1.percent}%")
      expect(page).to_not have_content(@discount_1.threshold)
    end

    it "takes me to the discount show page when the link is clicked" do
        visit "/merchant/#{@merchant.id}/discounts"

        click_link("##{@discount_1.id}")

        expect(current_path).to eq(merchant_discount_path(@merchant.id, @discount_1.id))
      end
  end
end