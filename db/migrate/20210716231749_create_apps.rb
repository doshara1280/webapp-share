class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :language, null: false
      t.text :free, null: false
      t.string :link, null: false
      t.integer :edit_count, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
