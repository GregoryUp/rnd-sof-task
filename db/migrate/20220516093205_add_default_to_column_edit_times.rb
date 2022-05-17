class AddDefaultToColumnEditTimes < ActiveRecord::Migration[7.0]
  def change
    change_column_default :news, :edited_times, 0
  end
end
