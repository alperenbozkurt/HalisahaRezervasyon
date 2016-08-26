class Astroturf < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :info, presence: true
  validates :phone, numericality: true
  has_many :comments
end
