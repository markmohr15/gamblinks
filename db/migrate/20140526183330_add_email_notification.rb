class AddEmailNotification < ActiveRecord::Migration
  def change
    add_column :users, :email_notification, :string
  end
end
