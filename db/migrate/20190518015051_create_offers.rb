class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :title
      t.integer :year
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
