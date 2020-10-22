class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references  :user,               null: false, foreign_key: true
      t.string      :name,               null: false 
      t.text        :description,        null: false
      t.integer     :category_id,        null: false
      t.integer     :condition_id,       null: false
      t.integer     :postage_player_id,  null: false
      t.integer     :shipping_area_id,   null: false
      t.integer     :shipping_date_id,   null: false
      t.string      :price,              null: false
      t.timestamps
    end
  end
end
