class AddSearchToStreets < ActiveRecord::Migration
  def change
    add_column :streets, :search, :string
  end
end
