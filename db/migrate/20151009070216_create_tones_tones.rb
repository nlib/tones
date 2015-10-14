class CreateTonesTones < ActiveRecord::Migration
  def change
    create_table :tones_tones do |t|
      t.string :name
      t.text :description
      t.text :short
      t.text :body
      t.text :de_short
      t.text :de_body

      t.timestamps null: false
    end
  end
end
