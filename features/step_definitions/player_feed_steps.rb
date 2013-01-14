
Given /^rotoworld has posted a new update on a specific player$/ do
  update = "Brady surges past Montana in playoff wins - Tom Brady | NE"
end

When /^my application scrapes rotoworld for new updates$/ do
  url = "http://www.rotoworld.com/rss/feed.aspx?sport=mlb&ftype=news&format=rss"
  PlayerFeed.update_from_feed(url)
end

Then /^I should see that new update in my player feed$/ do
  PlayerFeed.
end