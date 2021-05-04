class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.string :title
      t.string :url
      t.string :user_identifier, null: false
      t.belongs_to :poll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
