class Astroturf < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :info, presence: true
  validates :phone, numericality: true
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :services
  has_many :votes, dependent: :destroy
  has_many :reservation, dependent: :destroy
end
