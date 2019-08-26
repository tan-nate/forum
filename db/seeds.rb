# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

usa = Place.new(name: "USA")
natedogg = User.new(username: "natedogg", password: "bedope123")
border_crisis = Topic.new(name: "BorderCrisis")
border_crisis_quote_1 = Quote.new(text: "A federal appeals court panel ruled on Thursday that the government must provide detained migrant children with basic hygiene supplies such as toothbrushes and sleeping mats, ending a debate that incited national outrage after a Justice Department lawyer argued against the need to do so.", source_url: "https://www.nytimes.com/2019/08/15/us/migrant-children-toothbrushes-court.html")
