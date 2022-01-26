# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require "open-uri"


puts 'cleaning DB.....'
Step.destroy_all
Navigation.destroy_all
Place.destroy_all
User.destroy_all

puts "seeding"

 u1 = User.create!(name: "Erika", email: "fonsecarika@gmail.com", password: "123456789", password_confirmation: "123456789")
 u2 = User.create!(name: "Sarah", email: "sarah@gmail.com", password: "123456789", password_confirmation: "123456789")
 u3 = User.create!(name: "Ilhem", email: "illem@gmail.com", password: "123456789", password_confirmation: "123456789")
 u4 = User.create!(name: "Julie", email: "test@journey.com", password: "123456789", password_confirmation: "123456789")

puts 'created 3 users'

n1 = Navigation.create(starting_longitude: "5.373907044477363", starting_latitude: "43.294522397027606", ending_longitude: "5.380254614802709", ending_latitude: "43.30283129514038", done: true, user_id: User.last.id, time_deadline: "10:12:22.869900", date: "2022-01-06", weather: "Sunny")

puts 'created 1 navigation'
puts 'now creating places...'

p1 = Place.new(name: "Musée Cantini",
              interest: ["culture", "contemporary arts"],
              address: "19 Rue Grignan 13006 Marseille",
              user_id: u3.id,
              duration: 8,
              rating: 4,
              senses: ["best sight"],
              exterior: false,
              environment: ["calm", "windy"],
              description: "It houses collections of modern and contemporary art complemented by those of the Museum of Contemporary Art in Marseille. The museum initially exhibited his works from the 17th to the 19th century, including painters from the 19th century Provencal school, such as Paul Guigou, Adolphe Monticelli, Émile Loubon, René Seyssaud, Félix Ziem, Maurice Bompard, Jean-Antoine Constantin, Gustave Ricard or José Silbert. Since then, it has specialized more particularly in modern art from the first half of the twentieth century until the sixties and today houses one of the most important French provincial public collections covering the period 1900-1980, along with those museums in Lyon, Saint-Étienne, Grenoble or Strasbourg.")
url1 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831780/Marseille/Marseille%20new/musee_marseille_lovespots_cantini_05_eoacij.jpg"
file = URI.open(url1)
p1.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p2 = Place.new(name: "Opéra de Marseille",
              address: "2 Rue Molière 13001 Marseille",
              interest: ["opera","culture", "theater"],
              user_id: u3.id,
              duration: 4,
              rating: 4,
              senses: ["amazing hearing"],
              exterior: false,
              environment: ["windy", "rainy", "cloudy"],
              description: "It is a theater located in the district of the same name, not far from the Old Port. The first opera theater was created in Marseille in 1685 by the composer Pierre Gaultier who obtained permission from Lully to open such an establishment, in return for the payment of an excessive royalty which ruined it. It is said that Mademoiselle de Maupin (actress) performed there at the end of the 1680s.Marseille's municipal opera house is built on the remains of the Grand-Théâtre, which was destroyed by fire in 1919.")
url2 = "https://res.cloudinary.com/drwz0yg18/image/upload/Marseille/Marseille%20new/Ope%CC%81ra-de-Marseille-e1544270641705_mpz1pg.jpg"
file = URI.open(url2)
p2.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p3 = Place.new(name: "Palais du Pharo",
              interest: ["history", "culture"],
              address: "58, Boulevard Charles Livon 13007 Marseille",
              user_id: u3.id,
              duration: 9,
              rating: 5,
              senses: ["best sight"],
              exterior: false,
              environment: ["sunny"],
              description: "The Pharo Palace (from Occitan faròt, lighthouse) is a Marseille monument whose construction was ordered by Napoleon III for the Empress Eugenie in the second half of the 19th century. It now belongs to the city of Marseille and is a venue for conferences and various events. It overlooks the port pass, on the sea side, and the Pharo garden, on the town side.")
url3 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641886932/Marseille/Marseille%20new/depositphotos_379242336-stock-photo-marsigliafrancia-april2018-view-of-the_y60tuf.jpg"
file = URI.open(url3)
p3.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p4 = Place.new(name: "Mucem",
              interest:["arts", "contemporary arts", "culture", "sculpture"],
              address: "1 Esplanade J4 13002 Marseille",
              user_id: u3.id,
              duration: 4,
              rating: 4,
              senses: ["best sight"],
              exterior: false,
              environment: ["cloudy", "windy", "sunny", "rainy"],
              description: "The Museum of European and Mediterranean Civilizations (Mucem) is a national museum located in Marseille. It was inaugurated by President François Hollande on June 7, 2013, when Marseille was the European capital of culture.A society museum, the Mucem is a national museum placed under the supervision of the Ministry of Culture and devoted to the civilizations of Europe and the Mediterranean. By creating this museum in Marseille, the State is providing the second largest city in France with major cultural facilities.The permanent exhibitions are based on different scientific fields: anthropology, archeology, history, art history and contemporary art. The museum also offers temporary exhibitions often linked to artistic or societal news. The museum's vocation is to report on the historical and social permanence of this basin of civilization, as well as the tensions that run through it until the present day.According to the definition of ICOM and the principles of the “Museums Law” in France, the Mucem associates with its program of exhibitions, a rich cultural program. Like a forum, it is intended to be a place of debate, and the artistic and cultural program, as well as the exhibitions, seek to tackle the major questions which animate contemporary European and Mediterranean societies. The Mucem is one of the scientific departments of national museums, the bridgehead of social museums in France for the cultural anthropology of societies in Europe and the Mediterranean.")
url4 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831743/Marseille/Marseille%20new/le-mucem-porte-dacces-sur-les-enjeux-et-traditions-de-la-mediterranee-825x460_p5x9z2.jpg"
file = URI.open(url4)
p4.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/png')
p5 = Place.new(name: "Parc Borély",
              interest: ["botany", "biology", "photography", "ecology"],
              address: "Avenue du Parc Borély 13008 Marseille",
              user_id: u3.id,
              duration: 60,
              rating: 4,
              exterior: true,
              senses: ["amazing hearing", "best sight"],
              environment: ["sunny"],
              description: "Parc Borély is one of Marseille's public parks and gardens, in the Bonneveine district in the 8th arrondissement of Marseille. Historically associated with the Château Borély and the Marseille Borély racecourse-golf course, near the Prado beaches, at the end of the President-John-Fitzgerald-Kennedy corniche, it has been awarded the “remarkable garden” label.")
url5 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831735/Marseille/Marseille%20new/chateau-borely-marseille-21-848x566_fdrpqu.jpg"
file = URI.open(url5)
p5.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p6 = Place.new(name: "Palais des Arts",
              interest: ["arts", "painting", "culture", "literature"],
              address: "1, place Auguste et François Carli 13006 Marseille",
              user_id: u3.id,
              duration: 11,
              rating: 3,
              senses: ["best sight"],
              exterior: false,
              environment: ["windy","cloudy", "rainy"],
              description: "The Palais des Arts is a Marseille monument originally built in 1864 to house the municipal library and the École des Beaux-Arts in Marseille. It is located at the end of the Place Auguste-et-François-Carli, in the district of Thiers in the 1st arrondissement. The Palais des Arts benefited from registration as a Historic Monument on October 1, 1994 and was subsequently classified by decree of November 18, 1997.")
url6 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831783/Marseille/Marseille%20new/c10p02_Palais-des-arts_20150701_145542_emoqaj.jpg"
file = URI.open(url6)
p6.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p7 = Place.new(name: "Basilique Notre-Dame de la Garde",
              interest: ["architecture", "religion", "history"],
              address: "Rue Fort du Sanctuaire 13006 Marseille",
              user_id: u3.id,
              duration: 26,
              rating: 5,
              senses: ["best sight"],
              exterior: false,
              environment: ["windy", "cloudy", "rainy"],
              description: "The Notre-Dame-de-la-Garde basilica or more simply Notre-Dame-de-la-Garde, often nicknamed 'the Good Mother', is a minor basilica of the Catholic Church dating from the 19th century. Emblem of Marseille, dedicated to Notre-Dame de la Garde (protector of Marseille with Saint Victor), it dominates the city and the Mediterranean Sea from the top of Notre-Dame-de-la-Garde hill. True palladium of the city of Marseille, Notre-Dame de la Garde has been considered since the Middle Ages as the guardian of sailors and fishermen.")
url7 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831795/Marseille/Marseille%20new/photo-1630836741356-240933683544_y1sfb2.jpg"
file = URI.open(url7)
p7.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p8 = Place.new(name: "Palais Longchamp",
              interest: ["photography", "architecture", "botany", "arts"],
              address: "Boulevard jardin Zoologique 13004 Marseille",
              user_id: u3.id,
              duration: 33,
              rating: 4,
              senses: ["best sight"],
              exterior: false,
              environment: ["windy", "cloudy", "rainy"],
              description: "The Longchamp Palace is a neoclassical-Second Empire style water palace-water tower from the 19th century, in the Cinq-Avenues district of the 4th arrondissement of Marseille, in the Bouches-du-Rhône in Provence-Alpes-Côte d'Azur . The site has been listed as a historical monument since October 1, 1974 and classified since November 18, 1997 and September 8, 1999.")
url8 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641848739/Marseille/Marseille%20new/palais-longchamp-leotcm-1920x960_bi9huy.jpg"
file = URI.open(url8)
p8.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p9 = Place.new(name: "Escaliers du Cours Julien",
              interest: ["visual arts", "photography", "drawing"],
              address: "Rue Estelle 13006 Marseille",
              user_id: u3.id,
              duration: 12,
              rating: 4,
              senses: ["best sight"],
              exterior: true,
              environment: ["sunny"],
              description: "The Cours Julien stairs mark a symbolic passage between the city center and the designer district of Cours Julien… the associative art gallery located in the middle of the climb is also called the Antre de Monde… from its heights , the horizon emerges as far as the Palais de Justice with some evenings a beautiful view of the last rays of the sun the other attraction of the stairs, a huge playground for graffiti artists, visual artists and artists of all kinds.")
url9 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831798/Marseille/Marseille%20new/915366a866010a8ff49ab7e3ccd4e2f8_adnjfe.jpg"
file = URI.open(url9)
p9.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p10 = Place.new(name: "Centre de la Vieille Charité",
              interest: ["arts", "culture", "photography", "history", "archaeology"],
              address: "2 Rue de la Charité 13002 Marseille",
              user_id: u3.id,
              duration: 13,
              rating: 4,
              senses: ["amazing hearing", "best sight"],
              exterior: false,
              environment: ["cloudy", "windy", "rainy"],
              description: "La Vieille Charité, located rue de la Charité, in the heart of the Panier district in the 2nd arrondissement of Marseille, in the official Grands-Carmes district, is a building built in the 17th century, on plans by Pierre Puget to house the destitute and the poor of the city. It corresponds to the Marseille implementation of the “great confinement” that Michel Foucault highlighted in his famous History of Madness in the Classical Age (1962).The hospice is representative of the architecture of the seventeenth century, in particular due to the presence of the Puget chapel and its ovoid dome.")
url10 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831718/Marseille/Marseille%20new/vieille_charite_marseille-1_612x0_po46h9.jpg"
file = URI.open(url10)
p10.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p11 = Place.new(name: "Wonderful spices of Saladin",
                  interest: ["Cooking", "Nutrition", "Food", "Tradition"],
                  address: "10 Rue Longue des Capucins, 13001 Marseille",
                  user_id: u2.id,
                  duration: 15,
                  rating: 5,
                  senses: ['Best Smell'],
                  exterior: false,
                  environment: ["cloudy", "rainy", "windy"],
                  description: "Discover incredible spices from all around the world in this reknowed shop, emblematic of both Marseilles and the city center. A true institution alongside the Maison Empereur hardware store or the Père Blaise herbalist's store, Saladin is known to all food professionals and amateur cooks.")
url11 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831803/Marseille/Marseille%20new/saladin-epices-du-monde-boutique-marseille-all-year_nnyqz5.jpg"
file = URI.open(url11)
p11.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p12 = Place.new(name: "Fresh sea scents on the Old Port fish market",
                  interest: ["Food", "Tradition"],
                  address: "11 quai des Belges, 13001 Marseille",
                  user_id: u2.id,
                  duration: 25,
                  rating: 4,
                  senses: ['Best Sight', "Amazing Hearings", 'Best Smell'],
                  exterior: true,
                  environment: ["Sunny"],
                  description: "The Old Port of Marseille (in Provençal lo Pòrt Vielh according to the classical standard, lou Port-Vièi according to the Mistralian standard) is the oldest port of Marseille, as well as the historical and cultural center of the city since its foundation on this site. during Antiquity. The port was the economic center of Marseille until the middle of the 19th century, open to trade from the Mediterranean Sea and then from the French colonies. The commercial port activities were then moved to other sites further north: the basins of the current large seaport of Marseille. The Old Port is also a market place, since you can find there, several times a week, a direct sale of fresh fish.")
url12 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831805/Marseille/Marseille%20new/74321_itooft.jpg"
file = URI.open(url12)
p12.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p13 = Place.new(name: "Coffee experience takes you back to Marseilles' Roaring Twenties",
                  interest: ["Modern history", "Food", "Tradition"],
                  address: "56 la Canebière, 13001 Marseille",
                  user_id: u2.id,
                  duration: 5,
                  rating: 3,
                  senses: ['Best Smell', 'Best Tastes'],
                  exterior: false,
                  environment: ["cloudy", "windy", "rainy"],
                  description: "Torréfaction Noailles was created in the 20s and preserved a sense of its original setting. Travel the time on top of tasting great quality coffee!. The Noailles de la Canebière boutique is an old counter, tiling with a period motif, metal chairs for reminiscence without falling into nostalgia. It is also a calm, friendly and welcoming place a stone's throw from the old port where you can be served by the grandson of the founder of the Henry Blanc cafes.")
url13 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831808/Marseille/Marseille%20new/torrefaction-noailles-marseille-14512191980_svoto0.jpg"
file = URI.open(url13)
p13.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p14 = Place.new(name: "Clean body, dirty city",
                  interest: ["Tradition", "Biology"],
                  address: "Cours Julien, Marseille, Bouches-du-Rhône 13006, France",
                  user_id: u2.id,
                  duration: 30,
                  rating: 4,
                  senses: ['Best Smell'],
                  exterior: false,
                  environment: ["cloudy", "windy", "rainy"],
                  description: "Savonnerie Marseillaisse de la Licorne offers free visits of their soap manufacture, getting you through the whole process of this paradoxically traditional and world reknowed industry of Marseilles. La Savonnerie de la Licorne offers a range of high quality and renowned Marseille soaps, which are delivered and appreciated all over the world.")
url14 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831812/Marseille/Marseille%20new/IMG_6888_xcbtew.jpg"
file = URI.open(url14)
p14.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p15 = Place.new(name: "Making of virtuosos",
                  interest: ["Culture", "Performing arts", "Music", "Opera"],
                  address: "10 rue de la bibliothèque, 13001 Marseille",
                  user_id: u2.id,
                  duration: 20,
                  rating: 3,
                  senses: ["Amazing Hearings"],
                  exterior: true,
                  environment: ["sunny"],
                  description: "This elite music school offers the secret opportunity to let you listen to amazing musical talents for free: don't try to get it, but rather walk in the nearby street where you might have a chance to hear a future classical music star, or at least the poetry of a young person training without rest.")
url15 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641886664/Marseille/Marseille%20new/thumbnail_ks6mqs.jpg"
file = URI.open(url15)
p15.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p16 = Place.new(name: "Place Castellane",
              interest: ["scultpture", "culture", "photography", "history"],
              address: "Place Castellane 13006 Marseille",
              user_id: u3.id,
              duration: 32,
              rating: 4,
              senses: ["amazing hearing", "best sight"],
              exterior: true,
              environment: ["sunny"],
              description: "Place Castellane is a square located not far from the center of Marseille (6th arrondissement). It owes its name to Henri-César de Castellane-Majastre who offered the land and the financing of the works in 1774. Before being replaced by a fountain, this square had an obelisk in its center between 1811 and the beginning of the 20th century. It was on the occasion of the birth of the son of Emperor Napoleon I: the King of Rome.")
url16 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831815/Marseille/Marseille%20new/castellane-marseille_ht5yyu.jpg"
file = URI.open(url16)
p16.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p17 = Place.new(name: "Ciel I Rooftop",
              interest: ["cooking", "food", "photography"],
              address: "17 Rue Haxo, 13001 Marseille",
              user_id: u3.id,
              duration: 3,
              rating: 4,
              senses: ["best sight", "best smell", "best tastes"],
              exterior: true,
              environment: ["sunny"],
              description: "Ciel is a rooftop restaurant in the heart of Marseille. An incredible roof terrace nestled on one of the tallest buildings in the center [the former Galeries Lafayette], which dominates the city, the entrance to the Old Port and faces the good mother! It is a unique place, located at the top of the new THE BABEL COMMUNITY complex, a hybrid building that offers co-living accommodation, coworking offices, a gym...Ciel is both an authentic Italian restaurant offering simple seasonal cuisine and an ideal bar to enjoy one of the most beautiful sunsets in the city ... You want to have lunch on the terrace and admire the city, have a drink, savor some antipasti and enjoy the sunset, dine there like in an Apulian trattoria? So take the (hidden) elevator from 17 rue Haxo and meet us on the 7th floor.")
url17 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831818/Marseille/Marseille%20new/news_2293_tc9qhv.jpg"
file = URI.open(url17)
p17.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p18 = Place.new(name: "Le Musée du Savon de Marseille",
              interest: ["photography", "culture"],
              address: "25 Quai de Rive Neuve, 13007 Marseille",
              user_id: u3.id,
              duration: 20,
              rating: 4,
              senses: ["best sight", "best smell"],
              exterior: false,
              environment: ["windy", "cloudy", "rainy"],
              description: "Picturesque museum with objects and demonstrations on soap making, and personalized souvenirs. A manufacturing unit from the last century shows the different stages. There is a granite millstone, which, driven by a donkey, made it possible to obtain the raw material. You can also admire a lavender distiller. The extraction of the precious essential oil has made it possible, for several generations, to enrich our soap. Many other treasures are exhibited in this magical place (washerwoman, washing machines, molds and documents etc.).In a second part, there is an active production unit. Visitors, who wish, can participate in the soap making.")
url18 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641832942/Marseille/Marseille%20new/muse%CC%81e-du-savon-de-marseille-la-licorne-marseille-all-year_zmxc6x.jpg"
file = URI.open(url18)
p18.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p19 = Place.new(name: "Cathédrale de la Major",
              interest: ["architecture", "photography", "religion"],
              address: "Place de la Major, 13002 Marseille",
              user_id: u3.id,
              duration: 23,
              rating: 5,
              senses: ["best sight", "calm"],
              exterior: false,
              environment: ["windy", "cloudy", "rainy"],
              description: "The Sainte-Marie-Majeure cathedral, known as La Major, is the Catholic cathedral of the Archdiocese of Marseille. La Major was built in a neo-Byzantine style between 1852 and 1893 on the plans of the architect Léon Vaudoyer. Located in the district of Joliette in the 2nd arrondissement, it stands on the Jean-Paul II esplanade, between the Old Port and the port of Joliette, on the site of the old 12th century cathedral, d 'where the Occitan name of 'Major' comes from. Its architecture and interior decoration, in marble and porphyry, give it a particular aspect for a religious building. It was erected into a minor basilica by Leo XIII on January 24, 1896.")
url19 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831821/Marseille/Marseille%20new/14013216928_3958ea2f7c_b_ymanbo.jpg"
file = URI.open(url19)
p19.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p20 = Place.new(name: "Port Antique",
              interest: ["architecture", "photography", "history", "archaeological"],
              address: "2 Rue Henri Barbusse, 13001 Marseille",
              user_id: u3.id,
              duration: 11,
              rating: 4,
              senses: ["best sight"],
              exterior: true,
              environment: ["sunny"],
              description: "Small public park with archaeological remains of the Roman road and Greek fortifications of the old port. The Jardin des Vestiges is a garden housing the archaeological remains of the ancient Port of Marseille, France. The site, located behind the Center Bourse in the 1st arrondissement and which is classified as a historical monument, was brought to light in 1967. The garden was created by Joël-Louis Martin, landscape architect and it is now part of the Marseille History Museum. The Jardin des Vestiges was inaugurated on October 17, 2009.")
url20 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831825/Marseille/Marseille%20new/jardin-vestige-antique-centre-bourse-1400x934_p5gh0l.jpg"
file = URI.open(url20)
p20.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p21 = Place.new(name: "Eglise Saint Laurent",
              interest: ["history", "religion"],
              address: "16 Esplanade de la Tourette, 13002 Marseille",
              user_id: u3.id,
              duration: 20,
              rating: 4,
              senses: ["best sight"],
              exterior: false,
              environment: ["rainy", "windy", "cloudy"],
              description: "Historic Catholic Church with simple and refined architecture, with panoramic view from the hill. Saint-Laurent Church is a Provencal Romanesque style church located 16 Esplanade de la Tourette, in the 2nd arrondissement of Marseille near Fort Saint-Jean, on a hill to which it gave its name. It is the parish of the fishermen of Marseille.")
url21 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641847771/Marseille/Marseille%20new/eglise-saint-laurent-marseille_u3olga.jpg"
file = URI.open(url21)
p21.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p22 = Place.new(name: "Friche de la Belle de Mai",
              interest: ["photography", "history"],
              address: "41 Rue Jobin, 13003 Marseille",
              user_id: u3.id,
              duration: 19,
              rating: 4,
              senses: ["best sight","amazing hearings"],
              exterior: true,
              environment: ["sunny"],
              description: "La Friche la Belle de Mai is a cultural wasteland in Marseille bringing together artistic and cultural workplaces, performance and exhibition halls. More than sixty artistic and cultural structures from all disciplines (theater, dance, music, contemporary art, radio) bring it to life.")
url22= "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831764/Marseille/Marseille%20new/te%CC%81le%CC%81chargement_um7lvs.jpg"
file = URI.open(url22)
p22.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p23 = Place.new(name: "Théâtre La Criée",
              interest: ["performing arts", "danse"],
              address: "30 Quai Rive Neuve, 13007 Marseille",
              user_id: u3.id,
              duration: 24,
              rating: 4,
              senses: ["best sight"],
              exterior: false,
              environment: ["rainy", "cloudy", "windy"],
              description: "La Criée - National Theater of Marseille is a theater which has the status of National Dramatic Center. Founded in 1981 by Marcel Maréchal at 30, quai de Rive-Neuve in Marseille (France), it opens onto the Old Port.")
url23 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831739/Marseille/Marseille%20new/la-crie%CC%81e-the%CC%81a%CC%82tre-national-de-marseille_x3cd8a.jpg"
file = URI.open(url23)
p23.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p24 = Place.new(name: "Abbaye Saint-Victor",
              interest: ["architecture", "photography", "history"],
              address: "Place Saint Victor, 13007 Marseille",
              user_id: u3.id,
              duration: 24,
              rating: 4,
              senses: ["best sight"],
              exterior: false,
              environment: ["cloudy", "windy", "rainy"],
              description: "The Saint-Victor de Marseille Abbey was founded in the 5th century by Jean Cassien, near the tombs of the martyrs of Marseille, including Saint Victor of Marseille († in 303 or 304), who gave it its name. The abbey took on considerable importance at the turn of the first millennium through its influence throughout Provence. One of its abbots, Guillaume de Grimoard, was elected pope in 1362 under the name of Urbain V. From the fifteenth century, the abbey began to decline beyond repair. For more than 1,500 years, Saint-Victor has been one of the high places of Catholicism in the south of France and although the monastery was dismantled during the Revolution, the church is still used for worship.")
url24 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831828/Marseille/Marseille%20new/abbaye-saint-victorjorengo2-1920x960_nrwzxj.jpg"
file = URI.open(url24)
p24.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p25 = Place.new(name: "Parc de la Colline Puget",
              interest: ["photography", "botany"],
              address: "25 Boulevard de la Corderie, 13007 Marseille",
              user_id: u3.id,
              duration: 26,
              rating: 4,
              senses: ["best sight"],
              exterior: true,
              environment: ["sunny"],
              description: "It is the oldest of the gardens in Marseille! Located at the top of a hill overlooking the Old Port, it takes the form of paths winding up the hillside. Built in 1801, the work will last for more than 50 years. The last extensions date from the Second Empire. For those who have climbed the hill to its summit, the reward from this piece of nature in the city is a magnificent and breathtaking view of Marseille. Once at the top, why not continue the ascent to the nearby Basilica of Notre Dame de La Garde.")
url25 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641846708/Marseille/Marseille%20new/love-spots_jardin-puget_05_nll0s9.jpg"
file = URI.open(url25)
p25.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p26 = Place.new(name: "Théâtre du Gymnase",
              interest: ["performing arts", "danse"],
              address: "4 Rue du Théâtre Français, 13001 Marseille",
              user_id: u3.id,
              duration: 10,
              rating: 4,
              senses: ["best sight"],
              exterior: false,
              environment: ["cloudy", "windy", "rainy"],
              description: "Renovated in the 1980s, this Italian-style theater, founded in 1804, offers a varied program. The Theater du Gymnase is an Italian-style hall, inaugurated in 1804, in the heart of the historic district of Marseille, at the top of the famous avenue de la Canebière.")
url26 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641847115/Marseille/Marseille%20new/theatre-du-gymnase-a-marseille-37982520_nw5hws.jpg"
file = URI.open(url26)
p26.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p27 = Place.new(name: "Studio Fotokino",
              interest: ["visual arts", "painting", "photography"],
              address: "33 Allée Léon Gambetta, 13001 Marseille",
              user_id: u3.id,
              duration: 9,
              rating: 4,
              senses: ["best sight"],
              exterior: false,
              environment: ["cloudy", "windy", "rainy"],
              description: "The Fotokino association, created in 2000 in Marseille, is dedicated to the dissemination of artistic works in the field of visual arts. Our program is located at the crossroads of disciplines and strives to decompartmentalize artistic practices and audiences by offering throughout the year meetings related to graphic arts, photography, painting, illustration , in the cinema, in video or sound creation… Studio Fotokino offers a space for experimentation and sharing for artists and the public alike through a program of exhibitions, workshops and meetings. A place open to everyone, children and adults, which is part of our approach to raising awareness among young people, and awakening their critical thinking.")
url27 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831831/Marseille/Marseille%20new/te%CC%81le%CC%81chargement_8_dqwake.jpg"
file = URI.open(url27)
p27.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p28 = Place.new(name: "Porte d'Aix",
              interest: ["photography", "history", "architecture"],
              address: "19 Place Jules Guesde, 13003 Marseille",
              user_id: u3.id,
              duration: 6,
              rating: 4,
              senses: ["best sight"],
              exterior: true,
              environment: ["sunny"],
              description: "Triumphal arch designed by Michel-Robert Penchaud in honor of the victories of the Napoleonic wars. The triumphal arch has been classified as a historical monument since September 2, 1982.")
url28 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831834/Marseille/Marseille%20new/Porte_d_Aix_Marseille_jaow5s.jpg"
file = URI.open(url28)
p28.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p29 = Place.new(name: "Place d'Armes",
              interest: ["photography", "history", "architecture"],
              address: "Esplanade du Fort Saint-Jean, 13002 Marseille",
              user_id: u3.id,
              duration: 23,
              rating: 5,
              senses: ["best sight", "amazing hearings"],
              exterior: true,
              environment: ["sunny"],
              description: "With its village, gardens and countless little secrets, Fort Saint-Jean is a joyful labyrinth, in which it is advisable to come and get lost.")
url29 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831838/Marseille/Marseille%20new/1680x817_nlaahk.jpg"
file = URI.open(url29)
p29.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')
p30 = Place.new(name: "La Maison Diamantée",
              interest: ["culture", "history", "architecture"],
              address: "3 Rue de la Prison, 13002 Marseille",
              user_id: u3.id,
              duration: 16,
              rating: 4,
              senses: ["best sight"],
              exterior: true,
              environment: ["sunny"],
              description: "The Diamantée house is a building in Marseille located just behind the town hall, in the town hall district. It owes its name to the appearance of its facade, which is covered with stone cut in points: prismatic bosses. It has been classified as a historical monument since November 10, 1925.")
url30 = "https://res.cloudinary.com/drwz0yg18/image/upload/v1641831842/Marseille/Marseille%20new/Maison_Diamante%CC%81e__3x2_crop_hjjmsc.jpg"
file = URI.open(url30)
p30.photo.attach(io: file, filename: 'file.jpg', content_type: 'image/jpg')

places = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30]
places.each do |place|
  place.save!
 puts 'created 1 place .....'
end

 puts ' done seeding ......'
