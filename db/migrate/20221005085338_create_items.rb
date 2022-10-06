class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :merchandise_name, null: false
      t.text       :merchandise_explanation, null: false
      t.integer    :merchandise_category_id, null: false
      t.integer    :merchandise_condition_id, null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :area_id, null:false
      t.integer    :time_to_ship_id, null: false
      t.integer    :merchandise_price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end