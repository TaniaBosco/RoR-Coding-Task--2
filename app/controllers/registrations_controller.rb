=begin
Used for sign up.Entering data into the database by post method and can activate the account through 
confirmation mail by making confirmation token NULL and setting authentication token.
=end
class RegistrationsController < Devise::RegistrationsController
  	def create
  		if (params[:email] and params[:password])
     		begin

        		user = User1.create!(:email => params[:email], :password => params[:password])
            
               		    render :json => {":response" => "success", ":message" => "Please activate account via email"}
           		rescue Exception => e
               			render :json => {:data => nil, :message => e.message}         
     		end
                else
                     render :json => {:response=> "FAILURE", :message => "WRONG REQUEST METHOD"}   
     	 end
  	end 
end