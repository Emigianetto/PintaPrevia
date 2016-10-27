class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :message
      t.belongs_to :author, :class_name => 'PreviaGroup', index: true
      t.belongs_to :chat, :class_name => 'Chat', index: true

      t.timestamps null: false
    end
  end
end
