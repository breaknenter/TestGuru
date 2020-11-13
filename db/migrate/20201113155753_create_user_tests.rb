class CreateUserTests < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tests do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :test, null: false, foreign_key: true, index: true
    end
  end
end
