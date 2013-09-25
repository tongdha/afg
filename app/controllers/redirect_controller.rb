class RedirectController < ApplicationController
  
  def redirect
 #    request.headers['HTTP_REFERER'] = 'http://localhost2'
  #    redirect_to "#{params[:url]}"
  @redirectUrl = "http://www.amazon.com/gp/product/" + params[:asin] + "?tag=araise-20%26linkCode=xm2%26camp=2025%26creative=165953%26creativeASIN=" + params[:asin]
  render :layout => false
  end
end