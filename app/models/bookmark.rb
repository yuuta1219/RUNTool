class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :user_id, uniqueness: {scope: :board_id}
end
