class AddTimeToPassToTest < ActiveRecord::Migration[6.0]
  def up
    add_column :tests, :time_to_pass, :integer, null: false, default: 5
  end

  def down
    remove_column :tests, :time_to_pass, if_exists: true
  end
end
