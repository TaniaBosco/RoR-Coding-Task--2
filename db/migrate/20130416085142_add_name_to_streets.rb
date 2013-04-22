class AddNameToStreets < ActiveRecord::Migration
  def change
    add_column :streets, :name, :string
  end
end
