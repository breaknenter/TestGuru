class CreateBadges < ActiveRecord::Migration[6.0]
  def up
    create_table :badges do |t|
      t.string :rule,   null: false
      t.string :value,  null: false
      t.string :reward, null: false

      t.index [:rule, :value, :reward], unique: true

      t.timestamps
    end
  end

  def down
    drop_table :badges, if_exists: true
  end
end
