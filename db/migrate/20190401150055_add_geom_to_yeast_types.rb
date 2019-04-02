class AddGeomToYeastTypes < ActiveRecord::Migration[5.2]
  def up
    add_column :yeast_types, :geom, :geometry, geographic: true, srid: 4326

    YeastType.update_geoms_from_coordinates
  end

  def down
    remove_column :yeast_types, :geom
  end
end
