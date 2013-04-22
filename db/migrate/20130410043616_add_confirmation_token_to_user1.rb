class AddConfirmationTokenToUser1 < ActiveRecord::Migration
  def change
    add_column :user1s, :confirmation_token, :string
  end
end
