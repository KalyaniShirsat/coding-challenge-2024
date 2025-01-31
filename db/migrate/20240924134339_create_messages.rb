class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :user, null: true, foreign_key: true
      t.references :doctor, null: true, foreign_key: { to_table: 'users' }
      t.references :order, null: false, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
