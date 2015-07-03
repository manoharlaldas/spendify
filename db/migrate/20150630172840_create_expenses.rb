class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
    	t.time :time
    	t.date :date
    	t.integer :user_id
    	t.text :comment
    	t.integer :total
    	t.boolean :checkbox
    	t.string :merchant
      t.string :category


      t.timestamps null: false
    end
  end
end
