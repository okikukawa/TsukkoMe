class AddUserRefToSituations < ActiveRecord::Migration[5.2]
  def change
    add_reference :situations, :user, foreign_key: true
  end
end
