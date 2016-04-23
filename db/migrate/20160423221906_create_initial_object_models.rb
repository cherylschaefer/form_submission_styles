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
  end
end
