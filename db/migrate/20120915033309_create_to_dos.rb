class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.string :text
      t.boolean :completed
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :cost
      t.integer :rank
      t.timestamp :due_date

      t.timestamps
    end
  end
end
