class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true, null: false
      t.date :dead_line
      t.timestamps
    end
  end
end
