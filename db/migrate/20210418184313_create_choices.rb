class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.string :title, null: false
      t.string :url
      
      t.belongs_to :poll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
