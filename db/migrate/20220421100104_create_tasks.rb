class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :challenge, null: false, foreign_key: true
      t.text :question
      t.string :flag
      t.boolean :solved, default: false

      t.timestamps
    end
  end
end
