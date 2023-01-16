class AddDirectorFieldsToDirector < ActiveRecord::Migration[6.1]
  def change
    add_column :directors, :name, :string
    add_column :directors, :dob, :string
    add_column :directors, :bio, :text
  end
end
