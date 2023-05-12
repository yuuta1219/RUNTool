class RemoveRecordsWithIdsFiveToEight < ActiveRecord::Migration[7.0]
  def up
    Progress.where(id: [5, 6, 7, 8]).update_all(id: 1)
  end

  def down
  end
end
