class AddConfirmedAtToUser1 < ActiveRecord::Migration
  def change
    add_column :user1s, :confirmed_at, :datetime
  end
end
