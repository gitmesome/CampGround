class CreateCampsites < ActiveRecord::Migration[6.1]
  def change
    create_table :campsites do |t|
      t.string :name, null: false
      t.belongs_to :campground, foreign_key: true
      t.string :booked_dates, null: true
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
