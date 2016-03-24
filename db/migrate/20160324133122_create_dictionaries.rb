class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :name_en
      t.string :name_zh
      t.string :name_fr
      t.integer :dict_type_id

      t.timestamps null: false
    end
  end
end
