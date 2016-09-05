class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :astroturf
  belongs_to :user
end
