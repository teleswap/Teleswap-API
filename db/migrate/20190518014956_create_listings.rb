class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :body
      t.string :image_url
      t.float :longitude
      t.float :latitude
      t.string :city
      t.integer :zip_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
