class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :status

      t.references :project
      t.references :user
      t.timestamps
    end
  end
end
