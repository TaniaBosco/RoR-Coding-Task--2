class AddOriginalLatitudeToStreets < ActiveRecord::Migration
  def change
    add_column :streets, :original_latitude, :float
  end
end
