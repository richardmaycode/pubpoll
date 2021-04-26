class CreatePolls < ActiveRecord::Migration[6.1]
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.string :email, null: true
      t.string :access_token, null: false
      t.string :slug, index: true, unique: true, null: false

      t.boolean :allow_recommendations, default: false, null: false
      t.boolean :allow_comments, default: false, null: false
      t.boolean :allow_sharing, default: false, null: false
      t.boolean :discoverable, default: false, null: false
      t.boolean :published, default: true, null: false
      
      t.datetime :claimed_at, null: true 
      t.timestamps
    end
  end
end
