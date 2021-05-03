class UserBadges < ActiveRecord::Migration[6.0]
  def up
    create_table :user_badges do |t|
      t.references :user,  null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :user_badges, if_exists: true
  end
end
