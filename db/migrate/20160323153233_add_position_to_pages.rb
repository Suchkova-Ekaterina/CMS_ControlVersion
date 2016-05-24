class AddPositionToPages < ActiveRecord::Migration
  def change
    add_column :pages, :position, :string, default: "top_menu"
  end
end
