class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email, null: false # email should not be null
      t.string :password_digest

      t.timestamps
    end
  end
end
