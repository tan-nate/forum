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
border_crisis_quote = Quote.create(user: natedogg, topic: border_crisis, text: "A federal appeals court panel ruled on Thursday that the government must provide detained migrant children with basic hygiene supplies such as toothbrushes and sleeping mats, ending a debate that incited national outrage after a Justice Department lawyer argued against the need to do so.", source_url: "https://www.nytimes.com/2019/08/15/us/migrant-children-toothbrushes-court.html")
border_crisis_quote_against = Quote.create(user: eddie, topic: border_crisis, text: %Q("Remember, immigration – illegal immigration – is at historical lows. There is no crisis at the border [between the U.S. and Mexico]," the former press secretary said. "So, you've got to start from the place that everything the president's saying is fiction."

"It's very hard to negotiate with someone who's dealing with a made up problem," he said. While Lockhart said he believed Democrats and Republicans would find a way to compromise on border security, he suggested it would be a continuation of what the country has already been doing. He also mocked Trump's threat to declare a national emergency.

"They've already lost the messaging battle on the emergency because if it was an emergency, we would have already acted," he said. "It's him saying, 'it's an emergency, but I'll give you three weeks to talk about the emergency.'"), source_url: "https://www.newsweek.com/trump-border-crisis-fiction-made-problem-1307529")
border_crisis_quote_for = Quote.create(user: christina, topic: border_crisis, text: %Q(“Children are held on average about 26 hours in custody,” said Oscar Escamilla, acting deputy Border Patrol agent-in-charge, who led a brief tour through the center. There were fewer than 100 unaccompanied children in Customs and Border Protection custody at the time of the tour on Monday — far from the peak a few months ago, when children were backed up in the immigration system and were crowded into the agency’s facilities, sometimes for weeks.), source_url: "https://beta.washingtonpost.com/national/a-glimpse-inside-the-central-processing-center-at-the-heart-of-the-border-crisis/2019/08/12/5bbc576c-bd1c-11e9-a5c6-1e74f7ec4a93_story.html?noredirect=on")

usa.users << [natedogg, christina, eddie]

border_crisis.users << [natedogg, christina, eddie]

border_crisis_quote.supporters << border_crisis_quote_for
border_crisis_quote.opposers << border_crisis_quote_against

# CLIPBOARD ACTION

nates_clipboard = Clipboard.create(user: natedogg)
nates_clipboard.quotes << border_crisis_quote_against