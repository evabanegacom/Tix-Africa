class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :location
      t.datetime :event_date
      t.string :cost_type
      t.boolean :active, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
