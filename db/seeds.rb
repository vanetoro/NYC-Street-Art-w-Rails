# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Artist.delete_all
Neighborhood.delete_all
Mural.delete_all

baron = Artist.create(name: 'Gordon Stevenson', artist_name: 'Baron Von Fancy', bio: "Multimedia artist who lives and works in New York City")
pantone = Artist.create(name: 'Unknown', artist_name: 'Felipe Pantone', bio: 'Visual artist who is best known for his street art style that combines elements from graphic design with geometric shapes')
andre = Artist.create(name: 'André Saraiva ', artist_name: 'Andre', bio: 'André started tagging a top-hatted, stick figure character by the name of Mr. A on the streets of Paris, which earned him a reputation as a renowned graffiti artist')

soho = Neighborhood.create(name: "Soho")
bowery = Neighborhood.create(name: 'Bowery')

baron_mural = Mural.new(location_details: 'Mural on bowery')
baron_mural.artist = baron
baron_mural.neighborhood = bowery
baron_mural.save

pantone_mural = Mural.new(location_details: 'Auto Shop')
pantone_mural.artist = pantone
pantone_mural.neighborhood = soho
pantone_mural.save

andre_mural =  Mural.new(location_details: 'Prince Street Mural')
andre_mural.artist = andre
andre_mural.neighborhood = soho
andre_mural.save
