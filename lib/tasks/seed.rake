require 'csv'

namespace :seed do
  desc "Seed all tables"
  task meteorites: :environment do

    # Drop the old tables data before importing the new stuff.
    Order.destroy_all
    Posting.destroy_all
    Meteorite.destroy_all

    CSV.foreach("lib/assets/meteorite-landings.csv", :headers =>true) do |row|
      if row[6].to_i < 2018 && row[6].to_i > 2011 && row[7].to_i != 0 && row[8].to_i != 0
        puts row.inspect
        Meteorite.create!(
        name: row[0].to_s,
        meteorite_class: row[3].to_s,
        mass: row[4].to_f,
        year: row[6].to_i,
        latitude: row[7].to_f,
        longitude: row[8].to_f
        )
      end
    end
  end
end
