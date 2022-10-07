class AddFieldToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :desc, :string
  end
end
