# frozen_string_literal: true

class AddDateToPointEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :point_entries, :date, :date
  end
end
