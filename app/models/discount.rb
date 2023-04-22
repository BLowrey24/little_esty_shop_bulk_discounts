class Discount < ApplicationRecord
  belongs_to :merchant
  has_many :items, through: :merchant

  validates_presence_of :percent, :threshold
end