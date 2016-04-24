class CreateInitialObjectModels < ActiveRecord::Migration
  def change
    create_table :tribbles do |t|
      t.integer :user_id
      t.string :name
      t.string :image

      t.timestamps null: false
    end
    create_table :diamonds do |t|
      t.integer :user_id
      t.string :name
      t.string :image

      t.timestamps null: false
    end
    create_table :putties do |t|
      t.integer :user_id
      t.string :name
      t.string :image

      t.timestamps null: false
    end
    create_table :snowflakes do |t|
      t.integer :user_id
      t.string :name
      t.string :image

      t.timestamps null: false
    end
    add_index :snowflakes, :name, unique: true
    add_index :diamonds, :user_id, unique: true
    add_index :putties, :user_id, unique: true
  end
end
