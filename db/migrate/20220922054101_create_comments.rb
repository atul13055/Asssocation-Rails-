class CreateComments < ActiveRecord::Migration[6.1]
  def change
    add_column: :comments, :body, :string
    create_table :comments do |t|
      t.string :comentext
      t.string :body
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
