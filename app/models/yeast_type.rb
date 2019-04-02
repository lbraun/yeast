class YeastType < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: false, col_sep: " ") do |row|
      headers = [
        :sequence_name,
        :mcg,
        :gvh,
        :alm,
        :mit,
        :erl,
        :pox,
        :vac,
        :nuc,
        :localization_site,
        :longitude,
        :latitude,
      ]
      YeastType.create!(headers.zip(row).to_h)
    end

    YeastType.update_geoms_from_coordinates
  end

  def self.update_geoms_from_coordinates
    YeastType.update_all("geom = ST_PointFromText(CONCAT('POINT(',longitude,' ',latitude,')'), 4326)")
  end

  def self.yeast_map_data
    if ActiveRecord::Base.connection.table_exists? 'clip_polygons'
      yeast_types = all.joins(<<-SQL
          INNER JOIN clip_polygons ON ST_Intersects(yeast_types.geom, clip_polygons.geom)
        SQL
      )
    else
      yeast_types = all
    end

    yeast_types.map do |yeast_type|
      {
        id: yeast_type.id,
        name: yeast_type.sequence_name,
        x: yeast_type.longitude,
        y: yeast_type.latitude,
      }
    end
  end

  def self.clip(file)
    sql = `shp2pgsql #{file.original_filename} clip_polygons`
    ActiveRecord::Base.connection.execute(sql)

    ActiveRecord::Base.connection.exec_query(<<-SQL
        SELECT * FROM clip_polygons;
      SQL
    )
  end
end
