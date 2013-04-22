class AddUnconfirmedEmailToUser1 < ActiveRecord::Migration
  def change
    add_column :user1s, :unconfirmed_email, :string
  end
end
