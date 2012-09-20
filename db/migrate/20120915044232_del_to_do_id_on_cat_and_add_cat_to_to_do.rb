class DelToDoIdOnCatAndAddCatToToDo < ActiveRecord::Migration
  def up
		remove_column :categories, :to_do_id
		add_column :to_dos, :category_id, :integer
  end

  def down
		remove_column :to_dos, :category_id, :integer
		add_column :categories, :to_do_id, :integer
  end
end
