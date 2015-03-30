class CreateQuacks < ActiveRecord::Migration
  def change
    create_table :quacks do |t|
      t.string :body
      t.integer :user_id


      t.timestamps
    end
  end
end
