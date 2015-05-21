class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :identifier, limit: 10, null: false, unique: true
      t.string :title, limit: 254, null: false
      t.string :slug, limit: 254, null: false
      t.text :content, null: false
      t.date :publish_date
      t.string :status, null: false
      t.timestamps
    end
  end
end
