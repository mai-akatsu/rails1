class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :title
      t.datetime :starttime
      t.datetime :endtime
      t.timestamps
    end
  end
end
