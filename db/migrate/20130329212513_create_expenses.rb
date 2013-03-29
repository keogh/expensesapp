class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.decimal :price, :precision => 10, :scale => 2
      t.date :date
      t.integer :owner_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
