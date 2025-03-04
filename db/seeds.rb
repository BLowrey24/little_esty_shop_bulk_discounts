require 'faker'

Discount.destroy_all
InvoiceItem.destroy_all
Item.destroy_all
Transaction.destroy_all
Invoice.destroy_all
Customer.destroy_all
Merchant.destroy_all

# merchants
  2.times do
    Merchant.create!(
      name: Faker::Name.name
    )
  end

# items
  6.times do
    Item.create!(
      name: Faker::Appliance.equipment,
      description: Faker::Lorem.sentence,
      unit_price: Faker::Number.number(digits: 2),
      merchant_id: rand(1..2)
    )
  end
  
  # Discounts
  6.times do 
    Discount.create!(
      percent: Faker::Number.number(digits: 2),
      threshold: Faker::Number.number(digits: 2),
      merchant_id: rand(1..2)
    )
  end

# Customers
  6.times do
    Customer.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )
  end

# Invoices
  8.times do
    Invoice.create!(
      customer_id: rand(1..6),
      status: rand(1..2)
    )
  end

# InvoiceItems
  11.times do
    InvoiceItem.create!(
      invoice_id: rand(1..8),
      item_id: rand(1..6),
      quantity: Faker::Number.number(digits: 2),
      unit_price: Faker::Number.number(digits: 2),
      status: rand(1..2)
    )
  end

# Transactions
  8.times do
    Transaction.create!(
      credit_card_number: Faker::Number.number(digits: 6),
      result: rand(0..1),
      invoice_id: rand(1..8)
    )
  end
  
# require 'pry'; binding.pry

# @merchant1 = Merchant.create!(name: 'Hair Care')
# @merchant2 = Merchant.create!(name: 'Jewelry')

# @item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: @merchant1.id, status: 1)
# @item_2 = Item.create!(name: "Conditioner", description: "This makes your hair shiny", unit_price: 8, merchant_id: @merchant1.id)
# @item_3 = Item.create!(name: "Brush", description: "This takes out tangles", unit_price: 5, merchant_id: @merchant1.id)
# @item_4 = Item.create!(name: "Hair tie", description: "This holds up your hair", unit_price: 1, merchant_id: @merchant1.id)
# @item_7 = Item.create!(name: "Scrunchie", description: "This holds up your hair but is bigger", unit_price: 3, merchant_id: @merchant1.id)
# @item_8 = Item.create!(name: "Butterfly Clip", description: "This holds up your hair but in a clip", unit_price: 5, merchant_id: @merchant1.id)
# @item_5 = Item.create!(name: "Bracelet", description: "Wrist bling", unit_price: 200, merchant_id: @merchant2.id)
# @item_6 = Item.create!(name: "Necklace", description: "Neck bling", unit_price: 300, merchant_id: @merchant2.id)

# @discount1 = @merchant1.discounts.create!(percent: 10, threshold: 10)
# @discount2 = @merchant1.discounts.create!(percent: 20, threshold: 40)
# @discount3 = @merchant1.discounts.create!(percent: 20, threshold: 20)
# @discount4 = @merchant1.discounts.create!(percent: 30, threshold: 30)
# @discount5 = @merchant1.discounts.create!(percent: 40, threshold: 40)

# @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')
# @customer_2 = Customer.create!(first_name: 'Cecilia', last_name: 'Jones')
# @customer_3 = Customer.create!(first_name: 'Mariah', last_name: 'Carrey')
# @customer_4 = Customer.create!(first_name: 'Leigh Ann', last_name: 'Bron')
# @customer_5 = Customer.create!(first_name: 'Sylvester', last_name: 'Nader')
# @customer_6 = Customer.create!(first_name: 'Herber', last_name: 'Kuhn')

# @invoice_1 = Invoice.create!(customer_id: @customer_1.id, status: 2, created_at: "2012-03-27 14:54:09")
# @invoice_2 = Invoice.create!(customer_id: @customer_1.id, status: 2, created_at: "2012-03-28 14:54:09")
# @invoice_3 = Invoice.create!(customer_id: @customer_2.id, status: 2)
# @invoice_4 = Invoice.create!(customer_id: @customer_3.id, status: 2)
# @invoice_5 = Invoice.create!(customer_id: @customer_4.id, status: 2)
# @invoice_6 = Invoice.create!(customer_id: @customer_5.id, status: 2)
# @invoice_7 = Invoice.create!(customer_id: @customer_6.id, status: 2)
# @invoice_8 = Invoice.create!(customer_id: @customer_6.id, status: 1)

# @ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 9, unit_price: 10, status: 2)
# @ii_2 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_1.id, quantity: 1, unit_price: 10, status: 2)
# @ii_3 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_2.id, quantity: 2, unit_price: 8, status: 2)
# @ii_4 = InvoiceItem.create!(invoice_id: @invoice_4.id, item_id: @item_3.id, quantity: 3, unit_price: 5, status: 1)
# @ii_6 = InvoiceItem.create!(invoice_id: @invoice_5.id, item_id: @item_4.id, quantity: 1, unit_price: 1, status: 1)
# @ii_7 = InvoiceItem.create!(invoice_id: @invoice_6.id, item_id: @item_7.id, quantity: 1, unit_price: 3, status: 1)
# @ii_8 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_8.id, quantity: 1, unit_price: 5, status: 1)
# @ii_9 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_4.id, quantity: 1, unit_price: 1, status: 1)
# @ii_10 = InvoiceItem.create!(invoice_id: @invoice_8.id, item_id: @item_5.id, quantity: 1, unit_price: 1, status: 1)
# @ii_11 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_8.id, quantity: 12, unit_price: 6, status: 1)

# @transaction1 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_1.id)
# @transaction2 = Transaction.create!(credit_card_number: 230948, result: 1, invoice_id: @invoice_2.id)
# @transaction3 = Transaction.create!(credit_card_number: 234092, result: 1, invoice_id: @invoice_3.id)
# @transaction4 = Transaction.create!(credit_card_number: 230429, result: 1, invoice_id: @invoice_4.id)
# @transaction5 = Transaction.create!(credit_card_number: 102938, result: 1, invoice_id: @invoice_5.id)
# @transaction6 = Transaction.create!(credit_card_number: 879799, result: 0, invoice_id: @invoice_6.id)
# @transaction7 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_7.id)
# @transaction8 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_8.id)
