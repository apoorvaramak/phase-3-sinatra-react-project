class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthday
      t.integer :xp
      t.text :pfp
    end
  end
end
