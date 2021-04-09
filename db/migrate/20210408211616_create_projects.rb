class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :date_start
      t.date :date_end
      t.string :est_duration
      t.string :time_spent
      t.boolean :status

      t.timestamps
    end
  end
end
