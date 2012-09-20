class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :to_do_id
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
