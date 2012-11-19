class Login < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
      def self.create_with_omniauth(auth)  
        create! do |login|  
          login.provider = auth["provider"]  
          login.uid = auth["uid"]  
	  login.email= auth["info"]["email"]
          login.name = auth["info"]["name"]  
        end  
    end  
end
