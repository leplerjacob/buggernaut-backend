class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.boolean :resolved, default: false
      t.references :claimed_by, references: :users
      t.references :created_by, references: :users
      t.references :project
      t.references :task

      t.timestamps
    end
  end
end
