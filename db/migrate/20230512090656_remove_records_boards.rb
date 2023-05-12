class RemoveRecordsBoards < ActiveRecord::Migration[7.0]
  def change
    Board.where(progress_id: [5, 6, 7, 8]).update_all(progress_id: 1)
  end
end
