class AddStatusToAuthors < ActiveRecord::Migration[7.1]
  def change
    add_column :authors, :status, :string, default: "public"
    #Ex:- :default =>''
  end
end
