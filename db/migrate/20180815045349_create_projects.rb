class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.string :description
      t.integer :status, default: 0
      t.references :client, index: true
      t.integer :cost
      t.date    :start_date

      t.timestamps
    end
  end
end
