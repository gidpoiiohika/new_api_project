class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :name, null: false, default: ""
      t.string :description, null: false, default: ""
      t.bigint :user_id, null: false, default: ""
      t.datetime :date

      t.timestamps
    end
  end
end
