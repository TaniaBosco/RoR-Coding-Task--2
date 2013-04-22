class AddSearchToStreets < ActiveRecord::Migration
  def change
    add_column :streets, :Search, :string
  end
end
