class AddConfirmationSentAtToUser1 < ActiveRecord::Migration
  def change
    add_column :user1s, :confirmation_sent_at, :datetime
  end
end
