class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, index: true
      t.references :project, foreign_key: true, index: true
      t.string :body, null: false

      t.timestamps
    end
  end
end
