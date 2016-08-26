class Comment < ApplicationRecord
  belongs_to :astroturf
  belongs_to :user
end
