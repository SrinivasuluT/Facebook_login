class CreateHellos < ActiveRecord::Migration
  def change
    create_table :hellos do |t|
      t.string :username

      t.timestamps
    end
  end
end
