class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :receiving_postal_code    , null: false
      t.integer    :area_id                  , null: false
      t.string     :receiving_municipalities , null: false
      t.string     :receiving_house_number   , null: false
      t.string     :receiving_building_name
      t.string     :phone_number             , null: false
      t.references :order                    , null: false, foreign_key: true 
      t.timestamps
    end
  end
end