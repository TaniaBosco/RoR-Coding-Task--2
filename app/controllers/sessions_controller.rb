=begin
create method is used for sign in.Verifying password and email from the database and checking whether
confirmation token is NULL.If so,the an authentication token is allocated.
destroy method is used for sign out.Sign out from the current user by making authentication token NULL 
=end
class SessionsController < Devise::SessionsController
  	def create
               		if (params[:email] and params[:password]) 
     				           begin
          				        params[:password] = Digest::MD5.hexdigest(params[:password])
          				        user = User1.find_by_email_and_encrypted_password!(params[:email],params[:password])
          				        if user.confirmation_token.nil?
                        	     user.reset_authentication_token! 
                  				     render :json => {":response" => "SUCCESS", ":message" => "LOGIN SUCCESS. This is your oauth token for all requests until logout.",:AUTH_TOKEN => user.authentication_token}
	   				              else
	       					             render :json => {":response" => "FAIL", :message => "LOG IN UNSUCCESS"}
					                end
      	        		   rescue Exception => e
               				   render :json => {:data => nil, :message => e.message} 
     				           end
                  else
                      		render :json => {:message => "INVALID ENTRY OR WRONG REQUEST PARAMETER"}
                  end
        end
	def destroy
                     if (params[:authentication_token]) 
      		           begin
        	                user = User1.find_by_authentication_token(params[:authentication_token])
                                if(user.nil?)
                                render :json =>{:data => user, :message => "INVALID USER" }
                                else 
        	                user.update_attribute(:authentication_token,"NULL")
        	                render :json =>{:response => "SUCCESS", :message => "LOGGED OUT SUCCESSFULLY"}
                                end
        	                rescue Exception => e
           		        render :json => {:data => nil, :message => e.message}
                           end
                      else
                        render :json => {:message => "INVALID ENTRY OR WRONG REQUEST PARAMETER"}
                      end
			  
 	end     
  
end
