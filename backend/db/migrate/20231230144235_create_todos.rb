class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :detail
      t.boolean :isDone, default: false, null: false

      t.timestamps
    end
  end
end
