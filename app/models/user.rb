require 'open-uri'

class User < ActiveRecord::Base
  include ApiModule
  after_create :send_welcome_message
  has_many :authentications, :dependent => :destroy
  has_many :teams, :dependent => :destroy
  has_many :players, :through => :teams

#adding some more test garb

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable


  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name


  private

  def send_welcome_message
    UserMailer.welcome_email(self).deliver
  end
#adding some test code


  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |player|
        csv << player.attributes.values_at(*column_names)
      end
    end
  end


#need to work on this for refreshing user tokens
  # def refresh!
  #   old_one = self
  #   request_token = OAuth::RequestToken.new(YahooToken.consumer, self.token, self.secret)

  #   options={}
  #   options[:oauth_session_handle]=self.session_handle

  #   access_token = request_token.get_access_token options
  #   new_one = YahooToken.find_or_create_from_access_token self.user, access_token

  #   if new_one
  #     old_one.delete
  #     return new_one
  #   end

  #   return nil
  # end

end
