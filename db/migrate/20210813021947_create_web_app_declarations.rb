class CreateWebAppDeclarations < ActiveRecord::Migration[6.0]
  def change
    create_table :web_app_declarations do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.date :days, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
