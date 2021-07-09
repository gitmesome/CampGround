class CreateCampsites < ActiveRecord::Migration[6.1]
  def change
    create_table :campsites do |t|
      t.string :name, null: false
      t.belongs_to :campground, index: { unique: true }, foreign_key: true
      t.string :booked_date, null: true
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
