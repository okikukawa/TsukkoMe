class CreateTsukkomis < ActiveRecord::Migration[5.2]
  def change
    create_table :tsukkomis do |t|
      t.string :phrase, null: false
      t.references :situation, foreign_key: true

      t.timestamps
    end
  end
end
