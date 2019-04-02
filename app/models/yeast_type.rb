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
end
