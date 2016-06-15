class AddPosterToPoster < ActiveRecord::Migration
  def change
    add_column :posters, :poster, :string
  end
end
