class CreateAcceptableOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :acceptable_offers do |t|
      t.string :title
      t.integer :year
      t.string :description
      t.string :color
      t.string :image_url
      t.references :listing, foreign_key: true
      t.timestamps
    end
  end
end
