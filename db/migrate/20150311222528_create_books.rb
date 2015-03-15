class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :favorite_character
      t.text :description
      t.text :favorite_quotes

      t.timestamps null: false
    end
  end
end
