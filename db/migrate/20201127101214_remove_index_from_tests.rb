class RemoveIndexFromTests < ActiveRecord::Migration[6.0]
  def change
    remove_index :tests, name: "index_tests_on_title"
  end
end
