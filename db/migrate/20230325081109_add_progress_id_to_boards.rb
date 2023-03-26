class AddProgressIdToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :progress_id, :integer
  end
end
