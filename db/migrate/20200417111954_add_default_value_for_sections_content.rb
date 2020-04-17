class AddDefaultValueForSectionsContent < ActiveRecord::Migration[6.0]
  def change
    change_column :sections, :content, :text, default: ""
  end
end
