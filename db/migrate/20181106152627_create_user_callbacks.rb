class CreateUserCallbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_callbacks do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone
      t.integer :source
      t.text :text

      t.timestamps
    end
  end
end
