=begin
remote method=Hardcode the ip address
=end
class ApplicationController < ActionController::Base
   	protect_from_forgery
   	            def remote
                     if request.remote_ip == '127.0.0.1'
                                  # Hard coded remote address
                                  '115.248.107.225'       
                     else
                                  request.remote_ip 
                       
                     end
                 end
            	def after_sign_in_path_for(resource)
                    current_user1.reset_authentication_token! 
                    display_posts_path
                end
                def after_sign_out_path_for(resource) 
                    { controller: '/posts', action: 'signout_display', id: current_user1.id }
                end
 end
