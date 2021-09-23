class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      

      t.string :postcode  , null: false
      t.integer :place_id , null: false
      t.string :city      , null: false
      t.string :block     , null: false
      t.string :building  
      t.string :phone     , null: false
      t.references :buy, foreign_key: true

      t.timestamps
    end
  end
end
