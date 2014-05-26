class AddDefaultToEmailNotification < ActiveRecord::Migration
  def change
      change_column :users, :email_notification, :string, default: "Yes"
   end
end
