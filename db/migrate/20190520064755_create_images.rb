class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :url
      t.references :listing, foreign_key: true
      t.references :user, foreign_key: true
      t.references :counter_offer, foreign_key: true

      t.timestamps
    end
  end
end
