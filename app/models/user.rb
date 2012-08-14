class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation



  has_one :yahoo, :class_name => "YahooToken", :dependent => :destroy

  def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["info"]["name"]
  end
end

end
