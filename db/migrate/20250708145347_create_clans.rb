class CreateClans < ActiveRecord::Migration[8.0]
  def change
    create_table :clans, id: :uuid do |t|
      t.string :name, null: false
      t.belongs_to :account, null: false, foreign_key: { on_delete: :cascade }, type: :uuid

      t.timestamps
    end

    create_table :characters_clans, id: false do |t|
      t.belongs_to :character, null: false, foreign_key: { on_delete: :cascade }, type: :uuid
      t.belongs_to :clan, null: false, foreign_key: { on_delete: :cascade }, type: :uuid

      t.index [ :character_id, :clan_id ], unique: true
    end
  end
end
