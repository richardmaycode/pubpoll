class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.belongs_to :choice, null: false, foreign_key: true
      t.timestamps
    end
  end
end
