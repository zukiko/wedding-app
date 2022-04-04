class CreateSeatingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :seating_lists do |t|
      t.references   :user,null: false, foreign_key: true
      t.string       :table,null: false
      t.integer      :seat_number,null: false
      t.timestamps
    end
  end
end
