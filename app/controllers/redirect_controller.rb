class RedirectController < ApplicationController
  
  def redirect
 #    request.headers['HTTP_REFERER'] = 'http://localhost2'
  #    redirect_to "#{params[:url]}"
  @redirectUrl = "http://www.amazon.com/gp/product/" + params[:asin] + "?tag=pontpics-21%26linkCode=xm2"
  render :layout => false
  end
end