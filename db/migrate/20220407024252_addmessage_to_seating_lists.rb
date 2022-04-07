class AddmessageToSeatingLists < ActiveRecord::Migration[6.0]
  def change
    add_column :seating_lists, :message, :text
  end
end
