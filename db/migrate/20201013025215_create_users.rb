class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :mail
      t.string :room
      t.datetime :time_in
      t.datetime :time_out

      t.timestamps
    end
  end
end
