class CreateCampgrounds < ActiveRecord::Migration[6.1]
  def change
    create_table :campgrounds do |t|
      t.string :name, not_null: true
      t.timestamps
    end
  end
end
