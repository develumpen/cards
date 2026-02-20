class AddBodyToCard < ActiveRecord::Migration[8.1]
  def change
    add_column :cards, :body, :text
  end
end
