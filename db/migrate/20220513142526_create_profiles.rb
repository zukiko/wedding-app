class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text   :item,   null: false
      t.text   :groom_answer,   null: false
      t.text   :bride_answer,   null: false
      t.timestamps
    end
  end
end
