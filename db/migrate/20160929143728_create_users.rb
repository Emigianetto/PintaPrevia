class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :pass
      t.string :email
      t.string :gender
      t.date :birth_date
      t.belongs_to :city, index: true
      t.string :image

      t.timestamps null: false
    end
  end
end
