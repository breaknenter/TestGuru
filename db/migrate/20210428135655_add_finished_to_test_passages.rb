class AddFinishedToTestPassages < ActiveRecord::Migration[6.0]
  def up
    add_column :test_passages, :finished, :boolean, default: false
  end

  def down
    remove_column :test_passages, :finished
  end
end
