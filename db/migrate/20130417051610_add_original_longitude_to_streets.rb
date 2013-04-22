class AddOriginalLongitudeToStreets < ActiveRecord::Migration
  def change
    add_column :streets, :original_longitude, :float
  end
end
