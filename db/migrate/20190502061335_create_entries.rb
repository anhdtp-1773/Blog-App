class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :body
      t.string :picture
      t.integer :status

      t.timestamps
    end
  end
end
