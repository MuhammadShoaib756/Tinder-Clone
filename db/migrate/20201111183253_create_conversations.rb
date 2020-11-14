class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.integer :sender, null: false, references: :accounts
      t.integer :receipient, null: false, references: :accounts
      t.timestamps
    end
  end
end
