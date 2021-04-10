class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user_id
      t.references :project_id
      t.references :task_id

      t.text :text
      t.timestamps
    end
  end
end
