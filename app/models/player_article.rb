class PlayerArticle < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :players  
  belongs_to :player_feeds
end
