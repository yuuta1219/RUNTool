class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :boards
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_boards, through: :bookmarks, source: :board

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true

  def own?(object)
    id == object.user_id
  end

  def bookmark(board)
    #bookmarks_boardsにboardを追加する処理
    bookmark_boards << board
  end

  def unbookmark(board)
    bookmark_boards.delete(board)
  end

  def bookmark?(board)
    bookmark_boards.include?(board)
    #Bookmark.where(user_id: id, board_id: board.id).exist?と同じ
  end
end
