class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :parent
      t.references :comments
      t.references :user
      t.references :project
      t.references :task

      t.text :text
      t.timestamps
    end
  end
end
