class AddUserId2Card < ActiveRecord::Migration
  def change
    add_column :cards, :user_id, :integer
    add_index :cards, :user_id
  end
end
