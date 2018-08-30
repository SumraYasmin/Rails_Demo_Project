class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :amount, null: false
      t.date :date, null: false
      t.references :project, index: true

      t.timestamp
    end
  end
end
