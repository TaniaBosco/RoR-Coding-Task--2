class RemoveTypeFromStreets < ActiveRecord::Migration
  def up
    remove_column :streets, :type
  end

  def down
    add_column :streets, :type, :string
  end
end
