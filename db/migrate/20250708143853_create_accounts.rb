class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :username, null: false, index: { unique: true }
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
