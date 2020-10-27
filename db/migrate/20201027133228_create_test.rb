class CreateTest < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0, null: false

      add_reference :categories, :category, foreign_key: true
    end
  end
end
