class CreateCounterOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :counter_offers do |t|
      t.string :title
      t.integer :year
      t.string :description
      t.string :color
      t.string :image_url
      t.references :listing, foreign_key: true
      t.references :user, foreign_key: true
      t.references :acceptable_offer, foreign_key: true
      t.timestamps
    end
  end
end
