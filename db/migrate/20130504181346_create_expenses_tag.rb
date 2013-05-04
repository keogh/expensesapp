class CreateExpensesTag < ActiveRecord::Migration
  def change
  	create_table :expenses_tags, :id => false do |t|
  		t.integer :expense_id
  		t.integer :tag_id
  	end

  	add_index(:expenses_tags, [:expense_id, :tag_id], :unique => true)
  end
end
