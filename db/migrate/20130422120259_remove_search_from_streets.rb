class RemoveSearchFromStreets < ActiveRecord::Migration
  def up
    remove_column :streets, :Search
  end

  def down
    add_column :streets, :Search, :string
  end
end
