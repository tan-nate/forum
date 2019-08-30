# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

usa = Place.create(name: "USA")
natedogg = User.create(username: "natedogg", password: "bedope123")
eddie = User.create(username: "eddie", password: "trumpusa")
christina = User.create(username: "christina", password: "kombucha")
border_crisis = Topic.create(name: "BorderCrisis", place: usa)
border_crisis_quote = Quote.create(user: natedogg, text: "A federal appeals court panel ruled on Thursday that the government must provide detained migrant children with basic hygiene supplies such as toothbrushes and sleeping mats, ending a debate that incited national outrage after a Justice Department lawyer argued against the need to do so.", source_url: "https://www.nytimes.com/2019/08/15/us/migrant-children-toothbrushes-court.html")
border_crisis_quote_against = Quote.create(user: eddie, text: "The evidence provided by the quote is incorrect.", source_url: "https://foxnews.com")
border_crisis_quote_for = Quote.create(user: christina, text: "The evidence provided by the quote is correct.", source_url: "https://washingtonpost.com")

usa.users << [natedogg, christina, eddie]

border_crisis.users << [natedogg, christina, eddie]

border_crisis_quote.supporters << border_crisis_quote_for
border_crisis_quote.opposers << border_crisis_quote_against

border_crisis.quotes << [border_crisis_quote, border_crisis_quote_against, border_crisis_quote_for]