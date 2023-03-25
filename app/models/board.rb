class Board < ApplicationRecord

  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }
end
