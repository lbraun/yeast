class AddGeomToYeastTypes < ActiveRecord::Migration[5.2]
  def up
    add_column :yeast_types, :geom, :geometry, geographic: true, srid: 4326

    execute <<-SQL
      UPDATE yeast_types
      SET geom = ST_PointFromText(CONCAT('POINT(',longitude,latitude,')'), 4326);
    SQL
  end

  def down
    remove_column :yeast_types, :geom
  end
end
