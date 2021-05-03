class CreateBadges < ActiveRecord::Migration[6.0]
  def up
    create_table :badges do |t|
      t.string :name,   null: false
      t.string :reward, null: false

      t.index [:name, :reward], unique: true

      t.timestamps
    end
  end

  def down
    drop_table :badges, if_exists: true
  end
end
