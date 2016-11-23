class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :user, index: true
      t.boolean :readed
      t.text :message

      t.timestamps null: false
    end
  end
end
