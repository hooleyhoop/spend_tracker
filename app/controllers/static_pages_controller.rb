class StaticPagesController < ApplicationController

  def home
  	#set the instance variable so it is available in the view
		@title = "Home"
  end

  def contact
 		@title = "Contact"
  end

  def about
 		@title = "About"
  end

  def help
    @title = "Help"
  end

end
