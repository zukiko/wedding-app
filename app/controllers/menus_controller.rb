class MenusController < ApplicationController

  def index
    @menus = Profile.all
  end
  
end
