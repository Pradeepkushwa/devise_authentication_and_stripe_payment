class CreateSession < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.string :stripe_email
      t.string :stripe_token
      t.integer :amount

      t.timestamps
    end
  end
end
