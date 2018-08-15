class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.integer :status, default: 0
      t.integer :client_id
      t.integer :cost
      t.date    :start_date

      t.timestamps
    end
  end
end
