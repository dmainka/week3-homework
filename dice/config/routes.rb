Dice::Application.routes.draw do

  get '/dice', {:controller => "dice", :action => "home"}

  # due to the use of button_to buttons naturally POST (which can be overridden but I chose not to do that)
  # so the routes below respond to the POST action
  post '/dice', {:controller => "dice", :action => "home"}
  post '/start', {:controller => "dice", :action => "start"}
  post '/roll_again', {:controller => "dice", :action => "roll_again"}

  # this is old code based on the in-class example
  # get("/dice", { :controller => "dice", :action => "home"})
  # get("/start", { :controller => "dice", :action => "start"})
  # get("/roll_again", { :controller => "dice", :action => "roll_again"})

end
