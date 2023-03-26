class AddCategoryIdToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :category_id, :integer
  end
end
