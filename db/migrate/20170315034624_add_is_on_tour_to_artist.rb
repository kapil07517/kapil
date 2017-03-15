class AddIsOnTourToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :is_on_tour, :boolean
  end
end
