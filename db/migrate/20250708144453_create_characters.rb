class CreateCharacters < ActiveRecord::Migration[8.0]
  def change
    create_table :characters, id: :uuid do |t|
      t.string :name, null: false
      t.string :class_name, null: false
      t.integer :level, null: false, default: 1
      t.integer :xp, null: false, default: 0
      t.belongs_to :account, null: false, foreign_key: { on_delete: :cascade }, type: :uuid

      t.timestamps

      t.index [ :name, :account_id ], unique: true
    end
  end
end
