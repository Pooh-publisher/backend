class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :expected_completion_date
      t.string :category
      t.string :genre

      t.timestamps
    end
  end
end
