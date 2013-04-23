=begin
Call a mehod called remote to hardcode the ip address.Find the latitude and longitude of the ip address and
call the method togetlocation to get the list of hotels near by. 
=end
class StreetsController < ApplicationController	
def index
    @flag = false
    if (params[:authentication_token] and params[:search])
     begin
     user = User1.find_by_authentication_token(params[:authentication_token])
          if(user.nil?) || (params[:authentication_token]) == 'NULL'
              respond_to  do |format|
                    format.html
                    format.json{render :json =>{:data => user, :message => "INVALID USER"}}
              end
          else 
              client = remote()
              @name_address = Street.togetlocation(client,params[:search]) 
              if @name_address==false
                respond_to do |format|
                    format.html
                    format.json{render :json=>{:response=>"Can't access the location",:message=>"FAILURE "}}
                end
              else 
                  if @name_address.to_a.empty?
                      @empty = true
                      respond_to do |format|
                          format.html
                          format.json{render :json=>{:response=>"No Results found",:message=>"FAILURE "}} 
                      end
                  else  
                      @empty =false
                      respond_to do |format|
                          format.html               
                          format.json{render :json=>{:response=>@name_address,:message=>"success"}}
                      end
                  end
              end
          end     
          rescue Exception => e
              respond_to do |format|
                                 format.html
                                 format.json{render :json => {:data => nil, :message => e.message} }
              end    
            end                        
  else
       @flag=true
      respond_to do |format|
      format.html
      format.json{render :json => {:message => "INVALID ENTRY OR WRONG REQUEST PARAMETER"}}
    end
  end
 end
end
