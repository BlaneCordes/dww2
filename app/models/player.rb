class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  belongs_to :team
end
