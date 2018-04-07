class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|

      t.string :food
      t.string :sports
      t.string :foods
      t.string :dinner
      t.string :gender
      t.string :programming
      t.timestamps
      
    end
  end
end
