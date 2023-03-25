class AddProgressIdToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :progresses_id, :integer
  end
end
