class Discount < ApplicationRecord
  belongs_to :merchant
  has_many :items, through: :merchant
end