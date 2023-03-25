class RemoveProgressBoardsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :progress_boards
  end
end
