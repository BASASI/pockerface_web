class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :image_url
      t.integer :offense
      t.integer :stamina

      t.timestamps
    end
  end
end
