class CreateConsumers < ActiveRecord::Migration[6.0]
  def change
    create_table :consumers do |t|
      t.string       :post_code,         null: false
      t.integer      :address_id,        null: false
      t.string       :address_number,    null: false
      t.string       :municipality,      null: false
      t.string       :tel,               null: false
      t.references   :buyer,             null: false, foreign_key: true
      t.string       :building

      t.timestamps
    end
  end
end
