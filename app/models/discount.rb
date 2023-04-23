class Discount < ApplicationRecord
  belongs_to :merchant
  has_many :items, through: :merchant

  validates :threshold, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100}
  validates :percent, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100}
  validates_presence_of :percent, :threshold
end