class CreateQuestion < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.references :test, foreign_key: true
    end
  end
end
