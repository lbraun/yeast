class CreateYeastTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :yeast_types do |t|
      t.string :sequence_name
      t.decimal :mcg
      t.decimal :gvh
      t.decimal :alm
      t.decimal :mit
      t.decimal :erl
      t.decimal :pox
      t.decimal :vac
      t.decimal :nuc
      t.string :localization_site
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps
    end
  end
end
