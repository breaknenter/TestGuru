class CreateAnswer < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :text, null: false
      t.boolean :correct, default: 0

      add_reference :questions, :question, foreign_key: true
    end
  end
end
