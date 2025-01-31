class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :credit_card_number
      t.string :expiry
      t.string :cvv

      t.timestamps
    end
  end
end
