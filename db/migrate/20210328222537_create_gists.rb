class CreateGists < ActiveRecord::Migration[6.0]
  def up
    create_table :gists do |t|
      t.string :url, null: false

      t.references :user,     null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :gists, if_exists: true
  end
end
