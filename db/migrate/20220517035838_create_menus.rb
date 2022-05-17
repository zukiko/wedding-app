class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.text   :meal_menu,   null: false
      t.text   :alcohol,   null: false
      t.text   :alcohol_free,   null: false
      t.timestamps
    end
  end
end
