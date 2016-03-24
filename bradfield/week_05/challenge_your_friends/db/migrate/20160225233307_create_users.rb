class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :personal_websites do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end

    create_table :headings do |t|
      t.integer :website_id
      t.integer :level
      t.string :value

      t.timestamps
    end

    create_table :friendships do |t|
      t.integer :from
      t.integer :to

      t.timestamps
    end
  end
end
