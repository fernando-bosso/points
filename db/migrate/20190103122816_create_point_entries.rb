# frozen_string_literal: true

class CreatePointEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :point_entries do |t|
      t.integer :value
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
