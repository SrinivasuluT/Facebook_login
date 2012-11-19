class SessionsController < ApplicationController
   def create  
      #raise request.env["omniauth.auth"].to_yaml
      auth = request.env["omniauth.auth"] 
      @k = request.env["omniauth.auth"].to_yaml 
      login = Login.find_by_provider_and_uid_and_name(auth["provider"], auth["uid"], auth["name"]) || Login.create_with_omniauth(auth)
      session[:user_id] = login.id
      redirect_to root_url, :notice => "Signed in!"
   end  

 #def create
#    user = User.from_omniauth(env["omniauth.auth"])
 #   session[:user_id] = user.id
  #  redirect_to root_url
#  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
