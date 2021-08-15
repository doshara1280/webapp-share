class CreateDeclarationComments < ActiveRecord::Migration[6.0]
  def change
    create_table :declaration_comments do |t|
      t.text :sentence, null: false
      t.references :user, foreign_key: true
      t.references :web_app_declaration, foreign_key: true
      t.timestamps
    end
  end
end