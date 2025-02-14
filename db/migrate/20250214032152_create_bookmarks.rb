class CreateBookmarks < ActiveRecord::Migration[8.0]
  def change
    create_table :bookmarks do |t|
      t.timestamps
      t.string :comment
      t.references :movie, foreign_key: true, null: false
      t.references :list, foreign_key: true, null: false
    end
  end
end
