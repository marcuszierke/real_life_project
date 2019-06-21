require 'faker'
require 'json'
require 'rest-client'

cities_scrap = RestClient.get 'https://en.wikipedia.org/w/api.php?action=parse&page=List_of_cities_in_Germany_by_population&format=json'
cities = JSON.parse(cities_scrap)["parse"]["links"]

Faker::Config.locale = 'de'

puts 'Start seeding - clear database'

Pharmacy.destroy_all
Campaign.destroy_all
Product.destroy_all

puts 'Creates 50 Pharmacies with Opening hours'

50.times do |apo|
  number = rand(5..70)
  city = cities[number]["*"]
  city_code = rand(10...100000)
  
  pharmacy =Pharmacy.create(
    name: "Apotheke #{city}",
    street: "#{Faker::Artist.name}-#{['Weg', 'Strasse'].sample} #{rand(1..200)}",
    zip: "#{rand(10000...100000)}",
    city: city,
    phone: "+49 (0) #{city_code} #{rand(100...1000)} #{rand(100...1000)} #{rand(10...100)}",
    fax: "+49 (0) #{city_code} #{rand(100...1000)} #{rand(100...1000)} #{rand(10...100)}",
    email: "#{Faker::Name.first_name}.#{Faker::Name.first_name}@apotheke-#{city.split(' ').join('-')}.de".downcase
  )

  ['Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag', 'Sonntag'].each do |day|
    date = DateTime.new(2019,3,19,12,0,0)
    # start_time = date.hour - [2, 3, 4, 5].sample
    # end_time = date.hour + [5, 6, 7, 8, 9, 10].sample

    OpeningHour.create(
      pharmacy_id: pharmacy.id,
      day: day,
      start_time: date,
      end_time: date
    )
  end
end
  
puts 'All Pharmcies have been created!'

puts 'Creates 10 Campaigns with Products'

10.times do
  campaign = Campaign.create(
    start: Faker::Date.forward(rand(5..20)),
    end: Faker::Date.forward(rand(30..200)),
    name: "#{Faker::GreekPhilosophers.name} #{['Frühlings', 'Sommer', 'Herbst', 'Winter'].sample}-#{['Kampagne', 'Action', 'Special'].sample}"
  )
  
  products = ['Flyer', 'Ständer', 'Sample', 'Aufsteller', 'Maskottchen', 'Platzierung']
  adjectives = ['groß', 'schön', 'blau', 'gelb', 'glitzernd', 'klein', 'matt']
  
  rand(3..6).times do
    product = products.sample
    Product.create(
      campaign_id: campaign.id,
      name: product,
      price: rand(11.2...76.9).round(2),
      description: "#{product} - #{adjectives.sample} & #{adjectives.sample}"
    )
  end
end