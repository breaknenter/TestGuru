class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :tests, table_name: :user_tests do |t|
      t.index [:user_id, :test_id]
      t.index [:test_id, :user_id]
    end
  end
end
