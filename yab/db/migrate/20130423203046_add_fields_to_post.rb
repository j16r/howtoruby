class AddFieldsToPost < ActiveRecord::Migration
  def change
    change_table :posts do |table|
      table.string :title, null: false, default: ''
      table.string :body
    end
  end
end
