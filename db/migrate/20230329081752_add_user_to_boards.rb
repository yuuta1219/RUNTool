class AddUserToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :user_id, :integer, null: false, foreign_key: true
  end
end