class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
