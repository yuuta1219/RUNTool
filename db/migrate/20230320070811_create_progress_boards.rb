class CreateProgressBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :progress_boards do |t|
      t.references :board, null: false, foreign_key: true
      t.references :progress, null: false, foreign_key: true

      t.timestamps
    end
  end
end
