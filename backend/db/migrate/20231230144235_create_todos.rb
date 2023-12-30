class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :detail
      t.boolean :isDone

      t.timestamps
    end
  end
end
