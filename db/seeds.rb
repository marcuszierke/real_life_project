require 'faker'
Faker::Config.locale = 'de'

puts 'Start seeding - clear database'

Pharmacy.destroy_all
Campaign.destroy_all
Product.destroy_all

puts 'Creates 50 Pharmacies'

50.times do |apo|
  city = Faker::Address.city
  city_code = rand(10...100000)
  Pharmacy.create(
    name: "Apotheke #{city}",
    street: "#{Faker::Artist.name}-#{['Weg', 'Strasse'].sample} #{rand(1..200)}",
    zip: "#{rand(10000...100000)}",
    city: city,
    phone: "+49 (0) #{city_code} #{rand(100...1000)} #{rand(100...1000)} #{rand(10...100)}",
    fax: "+49 (0) #{city_code} #{rand(100...1000)} #{rand(100...1000)} #{rand(10...100)}",
    email: "#{Faker::Name.first_name}.#{Faker::Name.first_name}@apotheke-#{city}.de"
  )
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
# puts 'Creating the opening hours'

# days = ['Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag', 'Sonntag']
# counter = 1

# puts 'Assigning each pharmacy opening hours'

# 50.times do |hours|
#   start = 
# end
