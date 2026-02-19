class CreateCards < ActiveRecord::Migration[8.1]
  def change
    create_table :cards do |t|
      t.string :title
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
