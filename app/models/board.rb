class Board < ApplicationRecord

  has_many :bookmarks, dependent: :destroy
  belongs_to :user
  belongs_to :category
  belongs_to :progress


  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65_535 }

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["body","title"]
  end
end
