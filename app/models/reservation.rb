class Reservation < ApplicationRecord
  validates :date, presence: true
  belongs_to :user
  belongs_to :astroturf
end
