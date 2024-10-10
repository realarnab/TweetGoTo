class RemoveUserPasswordFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :user_password, :string
  end
end
