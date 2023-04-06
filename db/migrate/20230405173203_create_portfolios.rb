class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|
      t.references :user
      t.references :stock
      t.decimal :purchase_price
      t.decimal :sale_price
      t.integer :quantity, default: 1

      t.timestamps
    end
    add_index :portfolios, [:user_id, :stock_id, :created_at], :unique => true
  end
end
