require 'avaxhome'
class User < ActiveRecord::Base
  include Avaxhome
  
  
  acts_as_authentic
end
