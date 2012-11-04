require 'spec_helper'

describe User do

  before { @user = User.new(first_name: "Blane", last_name: "Cordes", email: "blane.cordes@gmail.com") }

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }  
  it { should respond_to(:email) }
end