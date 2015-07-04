class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :isbn, :limit => 8, null: false
      t.string :title, null: false
      t.string :subTitle
      t.string :author, null: false
      t.string :publisher, null: false
      t.text :description
      t.date :salesDate
      t.integer :itemPrice
      t.string :itemUrl

      t.timestamps null: false
    end

    add_index :books, [:title, :subTitle], :unique => true
  end
end
