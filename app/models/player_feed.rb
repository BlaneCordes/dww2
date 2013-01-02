class PlayerFeed < ActiveRecord::Base
	attr_accessible :guid, :description, :title, :url, :published_at


	def self.update_from_feed(feed_url)
		feed = Feedzirra::Feed.fetch_and_parse(feed_url)
		feed.entries.each do |entry|
		  unless exists? :guid => entry.id
		    create!(
		      :title        => entry.title,
		      :description  => entry.summary,
		      :url          => entry.url,
		      :published_at => entry.published,
		      :guid         => entry.id
		    )
		  end
		end
	end
end
