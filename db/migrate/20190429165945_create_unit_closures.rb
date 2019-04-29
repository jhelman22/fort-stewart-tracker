class CreateUnitClosures < ActiveRecord::Migration[5.2]
  def change
    create_table :unit_closures do |t|
      t.string :unit
      t.date :date
      t.string :status
    end
  end
end
