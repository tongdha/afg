class StaticPagesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:home, :about, :redirect]
  
  
  def home
  end

  def help
  end

  def about
  end
end
