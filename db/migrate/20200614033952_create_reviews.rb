class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :book, foreign_key: true, index: true
      t.string :state, index: true
      t.timestamps
    end
  end
end
