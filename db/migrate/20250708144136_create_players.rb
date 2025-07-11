class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players, id: :uuid do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email_address, index: { unique: true }
      t.belongs_to :account, null: false, index: { unique: true }, foreign_key: { on_delete: :cascade }, type: :uuid

      t.timestamps
    end
  end
end
