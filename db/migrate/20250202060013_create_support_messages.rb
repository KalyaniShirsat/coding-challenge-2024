class CreateSupportMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :support_messages do |t|
      t.references :sender, foreign_key: { to_table: 'users' }
      t.references :receiver, null: true, foreign_key: { to_table: 'users' }
      t.references :order, null: false, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
