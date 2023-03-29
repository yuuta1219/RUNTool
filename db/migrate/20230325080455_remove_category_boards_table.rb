class RemoveCategoryBoardsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :category_boards
  end
end
