class PostsController < ApplicationController
	
 	def display
     	 	@user = User1.find(current_user1.id)
      		render :json =>{ :email => @user.email, :password =>  @user.encrypted_password, :auth_token => @user.authentication_token}
      	end
        def signout_display 
       		@user = User1.find(params[:id])
       		@user.update_attribute(:authentication_token,"NULL")
       		render :json =>{ :email => @user.email, :password =>  @user.encrypted_password, :auth_token => @user.authentication_token}
       end
end
